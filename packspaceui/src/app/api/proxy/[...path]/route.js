import { NextResponse } from 'next/server';

const APIFY_TOKEN = process.env.APIFY_TOKEN;
const APIFY_ACTOR_ID = process.env.APIFY_ACTOR_ID;
const LARAVEL_URL = process.env.NEXT_PUBLIC_LARAVEL;

async function proxyRequest(request, { params }) {
    try {
        if (!APIFY_TOKEN) {
            return NextResponse.json(
                { error: 'APIFY_TOKEN is missing' },
                { status: 500 }
            );
        }

        if (!APIFY_ACTOR_ID) {
            return NextResponse.json(
                { error: 'APIFY_ACTOR_ID is missing' },
                { status: 500 }
            );
        }

        if (!LARAVEL_URL) {
            return NextResponse.json(
                { error: 'NEXT_PUBLIC_LARAVEL is missing' },
                { status: 500 }
            );
        }

        const { path } = await params;

        const endpoint = path.join('/');

        const targetUrl = `${LARAVEL_URL}/${endpoint}`;

        const method = request.method;

        console.log('================================');
        console.log('Proxy request:', method, targetUrl);

        // Headers
        const headers = {};

        const headersToForward = [
            'authorization',
            'content-type',
            'accept',
            'x-session-id',
            'x-requested-with',
            'x-xsrf-token',
        ];

        for (const headerName of headersToForward) {
            const value = request.headers.get(headerName);

            if (value) {
                headers[headerName] = value;
            }
        }

        // Body
        let body = null;

        if (method !== 'GET' && method !== 'HEAD') {
            body = await request.text();
        }

        const actorInput = {
            url: targetUrl,
            method,
            headers,
            body,
        };

        console.log('Actor input:', {
            url: targetUrl,
            method,
        });

        // Start Apify Actor
        const runResponse = await fetch(
            `https://api.apify.com/v2/acts/${encodeURIComponent(
                APIFY_ACTOR_ID
            )}/runs?token=${encodeURIComponent(
                APIFY_TOKEN
            )}&waitForFinish=120`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(actorInput),
                cache: 'no-store',
            }
        );

        const runText = await runResponse.text();

        if (!runResponse.ok) {
            console.error(
                'Apify run error:',
                runResponse.status,
                runText
            );

            return NextResponse.json(
                {
                    error: 'Apify run failed',
                    status: runResponse.status,
                    details: runText,
                },
                {
                    status: runResponse.status,
                }
            );
        }

        let run;

        try {
            run = JSON.parse(runText);
        } catch {
            console.error('Invalid Apify run JSON:', runText);

            return NextResponse.json(
                {
                    error: 'Invalid response from Apify',
                    details: runText,
                },
                {
                    status: 502,
                }
            );
        }

        const datasetId = run.data?.defaultDatasetId;

        if (!datasetId) {
            console.error('No dataset ID:', run);

            return NextResponse.json(
                {
                    error: 'Apify did not return a dataset',
                    run,
                },
                {
                    status: 502,
                }
            );
        }

        console.log('Dataset:', datasetId);

        // Read dataset
        const datasetResponse = await fetch(
            `https://api.apify.com/v2/datasets/${datasetId}/items?token=${encodeURIComponent(
                APIFY_TOKEN
            )}&clean=true`,
            {
                method: 'GET',
                cache: 'no-store',
            }
        );

        const datasetText = await datasetResponse.text();

        if (!datasetResponse.ok) {
            console.error(
                'Dataset error:',
                datasetResponse.status,
                datasetText
            );

            return NextResponse.json(
                {
                    error: 'Failed to read Apify dataset',
                    status: datasetResponse.status,
                    details: datasetText,
                },
                {
                    status: datasetResponse.status,
                }
            );
        }

        let items;

        try {
            items = JSON.parse(datasetText);
        } catch {
            console.error(
                'Invalid dataset JSON:',
                datasetText.substring(0, 1000)
            );

            return NextResponse.json(
                {
                    error: 'Invalid dataset response',
                    details: datasetText.substring(0, 1000),
                },
                {
                    status: 502,
                }
            );
        }

        const result = items?.[0];

        if (!result) {
            return NextResponse.json(
                {
                    error: 'Apify returned no data',
                },
                {
                    status: 502,
                }
            );
        }

        console.log('Apify result status:', result.status);
        console.log(
            'Apify result content type:',
            result.contentType
        );

        console.log(
            'Body preview:',
            String(result.body || '').substring(0, 500)
        );

        // IMPORTANT:
        // Do not pretend HTML is JSON.
        const responseContentType =
            result.contentType || 'text/plain';

        return new NextResponse(result.body || '', {
            status: Number(result.status) || 500,
            headers: {
                'Content-Type': responseContentType,
            },
        });
    } catch (error) {
        console.error('Proxy error:', error);

        return NextResponse.json(
            {
                error: 'Proxy failed',
                message: error.message,
            },
            {
                status: 500,
            }
        );
    }
}

export async function GET(request, context) {
    return proxyRequest(request, context);
}

export async function POST(request, context) {
    return proxyRequest(request, context);
}

export async function PUT(request, context) {
    return proxyRequest(request, context);
}

export async function PATCH(request, context) {
    return proxyRequest(request, context);
}

export async function DELETE(request, context) {
    return proxyRequest(request, context);
}