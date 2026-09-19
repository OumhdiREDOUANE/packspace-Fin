import { NextResponse } from "next/server";

const API_URL = process.env.NEXT_PUBLIC_LARAVEL;
const BROWSERLESS_TOKEN = process.env.BROWSERLESS_TOKEN;

async function proxyRequest(request, { params }) {
  try {
    const { path } = await params;
    const endpoint = path.join("/");
    const targetUrl = `${API_URL}/${endpoint}`;

    const method = request.method;

    // Headers
    const headers = {};

    const headersToForward = [
      "authorization",
      "content-type",
      "accept",
      "x-session-id",
      "x-requested-with",
      "x-xsrf-token",
    ];

    for (const headerName of headersToForward) {
      const value = request.headers.get(headerName);

      if (value) {
        headers[headerName] = value;
      }
    }

    // Body
    let body = null;

    if (method !== "GET" && method !== "HEAD") {
      body = await request.text();
    }

    const functionCode = `
      export default async ({ page }) => {

        const targetUrl = ${JSON.stringify(targetUrl)};
        const method = ${JSON.stringify(method)};
        const headers = ${JSON.stringify(headers)};
        const body = ${JSON.stringify(body)};
        const apiBase = ${JSON.stringify(API_URL)};

        try {

          /*
           * GET:
           * نستعمل page.goto مباشرة
           */
          if (method === "GET") {

            const response = await page.goto(
              targetUrl,
              {
                waitUntil: "networkidle2",
                timeout: 30000
              }
            );

            const status = response
              ? response.status()
              : 500;

            const contentType = response
              ? response.headers()["content-type"] || "application/json"
              : "application/json";

            const responseBody = await response.text();

            return {
              data: {
                status,
                contentType,
                body: responseBody
              },
              type: "application/json"
            };
          }


          /*
           * POST / PUT / PATCH / DELETE
           *
           * أولاً ندخل للدومين باستعمال browser.
           * هذا يساعد ByetHost browser challenge
           * ويعطي browser cookies/session.
           */
          await page.goto(
            apiBase,
            {
              waitUntil: "networkidle2",
              timeout: 30000
            }
          );


          /*
           * من داخل browser context
           * ندير fetch للـ Laravel API.
           */
          const result = await page.evaluate(
            async ({ targetUrl, method, headers, body }) => {

              try {

                const response = await fetch(
                  targetUrl,
                  {
                    method,
                    headers,
                    body:
                      method === "GET" || method === "HEAD"
                        ? undefined
                        : body,
                    credentials: "include"
                  }
                );

                const responseBody = await response.text();

                return {
                  success: true,
                  status: response.status,
                  contentType:
                    response.headers.get("content-type") ||
                    "application/json",
                  body: responseBody
                };

              } catch (error) {

                return {
                  success: false,
                  status: 500,
                  contentType: "application/json",
                  body: JSON.stringify({
                    error: "Browser page fetch failed",
                    message: error.message
                  })
                };

              }

            },
            {
              targetUrl,
              method,
              headers,
              body
            }
          );


          return {
            data: {
              status: result.status,
              contentType: result.contentType,
              body: result.body
            },
            type: "application/json"
          };

        } catch (error) {

          return {
            data: {
              status: 500,
              contentType: "application/json",
              body: JSON.stringify({
                error: "Browserless execution failed",
                message: error.message
              })
            },
            type: "application/json"
          };

        }
      };
    `;


    const browserlessUrl =
      `https://production-sfo.browserless.io/function` +
      `?token=${BROWSERLESS_TOKEN}` +
      `&proxy=residential` +
      `&proxyCountry=us` +
      `&proxySticky=true`;


    const browserlessResponse = await fetch(
      browserlessUrl,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/javascript",
        },
        body: functionCode,
        cache: "no-store",
      }
    );


    if (!browserlessResponse.ok) {

      const errorText =
        await browserlessResponse.text();

      console.error(
        "Browserless HTTP error:",
        browserlessResponse.status,
        errorText
      );

      return NextResponse.json(
        {
          error: "Browserless error",
          details: errorText,
        },
        {
          status: browserlessResponse.status,
        }
      );
    }


    const result =
      await browserlessResponse.json();

    const apiResult = result.data;


    return new NextResponse(
      apiResult.body,
      {
        status: apiResult.status,
        headers: {
          "Content-Type":
            apiResult.contentType ||
            "application/json",
        },
      }
    );


  } catch (error) {

    console.error(
      "Proxy error:",
      error
    );

    return NextResponse.json(
      {
        error: "Proxy failed",
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