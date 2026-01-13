# Backend (Laravel)

This folder contains the Laravel (PHP) API for Agri Sphere. It exposes endpoints used by the web frontend and mobile app.

## Prerequisites
- PHP 8.0+
- Composer
- MySQL / MariaDB (or other supported database)
- Node.js and npm (for compiling frontend assets if applicable)

## Setup
1. Copy `.env.example` to `.env` and configure DB and other environment variables.
2. Install PHP dependencies: `composer install`
3. Generate application key: `php artisan key:generate`
4. Install Node dependencies for assets (if needed): `cd frontend && npm install` or run from root if using mix.
5. Run migrations and seeders: `php artisan migrate --seed`

## Local development
- Start the dev server: `php artisan serve --host=127.0.0.1 --port=8000`
- API will be available at `http://127.0.0.1:8000` by default.

## Environment variables
- Set `APP_URL`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, `MAIL_...`, and any third-party API keys in `.env`.

## Common commands
- Run tests: `php artisan test`
- Run queues: `php artisan queue:work`
- Run scheduler: `php artisan schedule:work`

## Notes about AI model integration
- Place exported model artifacts (ONNX/TorchScript) into `storage/app/models/` or configure a path in `.env`.
- Provide a service class (e.g., `App\Services\ModelInferenceService`) to load model files and perform inference.

