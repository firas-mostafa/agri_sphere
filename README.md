# Agri Sphere

Agri Sphere is a multi-platform agricultural assistant project combining an AI model, a Laravel backend API, a React web frontend, and a Flutter mobile app. This repository contains each component in a separate folder so they can be developed and deployed independently.

## Repository structure
- aimodel/       - AI model, training scripts, and inference code
- backend/       - Laravel API (PHP)
- frontend/      - React web application
- mobile_app/    - Flutter mobile application
- README.md      - This top-level overview and quickstart

## Quickstart (high level)
1. Read the README inside each folder for platform-specific setup and running instructions.
2. Start the backend API first so frontends can connect to it.
3. Start the frontend (React) for web and the mobile app (Flutter) for mobile testing.
4. For AI model development, see aimodel/README.md for environment, training, and inference steps.

## Contributing
- Use feature branches named like `feat/<short-description>` or `fix/<short-description>`.
- Open a pull request with a clear description, testing steps, and any migration notes.

## Contact
For questions, contact the maintainer: firas-mostafa
