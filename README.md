# Packspace

Packspace is a full-stack e-commerce platform for discovering, configuring, and ordering packaging and print products. It combines a customer-facing storefront with a protected administration dashboard for managing the catalogue, orders, content, and customers.
## Available project
- web site [packspace-fin-eight.vercel.app](https://packspace-fin-eight.vercel.app/)
## Highlights

- Browse products by category, view product details, options, and images
- Cart and checkout flow for signed-in and guest customers
- Authentication, password reset, and role-aware administration
- Admin tools for products, categories, groups, product options, orders, carts, users, FAQs, blog posts, and settings
- Responsive Next.js user interface with reusable Radix-based UI components
- Laravel REST API with Sanctum-protected endpoints, JWT support, and Cloudinary integration
- Docker Compose configuration with MySQL database initialization

## Architecture

```text
packspace-Fin/
├── packspaceui/       # Next.js 16 storefront and administration dashboard
├── packSpaceApi/      # Laravel 12 REST API
├── packspace_db.sql   # MySQL database bootstrap dump
└── docker-compose.yml # Local multi-container environment
```

## Technology Stack

| Area | Technologies |
| --- | --- |
| Frontend | Next.js 16, React 19, Tailwind CSS, Radix UI, SWR, Axios |
| Dashboard | Recharts, Radix UI, Lucide icons |
| Backend | Laravel 12, PHP 8.2, Sanctum, JWT Auth |
| Data | MySQL 8 or SQLite for local development |
| Media | Cloudinary |
| Deployment | Docker, Docker Compose |

## Prerequisites

- Node.js 20 or later
- npm 10 or later
- PHP 8.2 or later
- Composer 2
- MySQL 8 (or Docker Desktop)

## Local Development

Run the frontend and API in separate terminals.

### 1. Start the Laravel API

```bash
cd packSpaceApi
composer install
cp .env.example .env
php artisan key:generate
```

Configure the database values in `packSpaceApi/.env`. For a new local database, then run:

```bash
php artisan migrate --seed
php artisan serve
```



> The repository includes `packspace_db.sql` for a MySQL bootstrap workflow. Use either that dump or Laravel migrations for a fresh environment, not both against the same database.

### 2. Start the Next.js application

```bash
cd packspaceui
npm install
```

Create `packspaceui/.env.local` with the local API address:



Then start the development server:

```bash
npm run dev
```



### Optional: Remote API Proxy

The Next.js proxy route at `src/app/api/proxy/[...path]/route.js` supports routing requests through an Apify actor. If you use it, configure these variables in `packspaceui/.env.local`:



Keep tokens in local or deployment environment settings; never commit them to the repository.

## Docker

Create a root `.env` file for Docker Compose:

```env
MYSQL_ROOT_PASSWORD=choose-a-strong-root-password
MYSQL_PASSWORD=choose-a-strong-application-password
```

On a case-sensitive host, update the frontend build context in `docker-compose.yml` from `./packSpaceui` to `./packspaceui` so it matches the directory name. Then run:

```bash
docker compose up --build
```

The application will be available at `http://localhost:3000`; the API is exposed on port `8000`.

## Available Commands

### Frontend

| Command | Description |
| --- | --- |
| `npm run dev` | Start the Next.js development server on port 3000 |
| `npm run build` | Create a production build |
| `npm run start` | Serve the production build |
| `npm run lint` | Run the configured lint command |

### Backend

| Command | Description |
| --- | --- |
| `php artisan serve` | Start the Laravel development server |
| `php artisan migrate --seed` | Run database migrations and development seeders |
| `php artisan test` | Run the Laravel test suite |
| `php artisan route:list --path=api` | List available API endpoints |

## API Overview

The Laravel API exposes resources for products, categories, carts, orders, users, groups, product options, FAQs, blogs, and application settings. Authentication endpoints cover registration, login, logout, password-reset requests, and password resets. See [packSpaceApi/routes/api.php](packSpaceApi/routes/api.php) for the full route definition.

## Security Notes

- Configure database, mail, Cloudinary, and proxy credentials exclusively through environment variables.
- Use unique, strong credentials in every deployed environment.
- Review API authorization policies before exposing dashboard resources publicly.
- Do not use development seed accounts or passwords in production.

## Project Links

- Portfolio: [oumhdiredouane.vercel.app](https://oumhdiredouane.vercel.app/)
- GitHub: [OumhdiREDOUANE](https://github.com/OumhdiREDOUANE)

## License

This project is private. All rights reserved unless a license is added to this repository.

