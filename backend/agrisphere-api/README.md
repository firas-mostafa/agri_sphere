# AgriSphere Backend API

Backend RESTful API for the AgriSphere platform built using Laravel.
The system provides authentication, role-based authorization, and full
product management for agricultural services.

---

## Tech Stack
- PHP 8+
- Laravel 10
- MySQL
- Laravel Sanctum
- RESTful API

---

## Setup Instructions

### 1. Install Dependencies
```bash
composer install

cp .env.example .env
php artisan key:generate
