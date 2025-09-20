# SafeOps Backend API

## Deployment Instructions

### Option 1: Railway (Recommended)
1. Create a new Railway project
2. Connect this repository
3. Set root directory to: Backend-Only
4. Add environment variable: DATABASE_URL (from Railway PostgreSQL)
5. Deploy

### Option 2: Heroku
1. Create Heroku app
2. Add PostgreSQL addon
3. Deploy with: git subtree push --prefix Backend-Only heroku main

### Option 3: Azure App Service
1. Create App Service
2. Configure PostgreSQL connection
3. Deploy from this folder

## Environment Variables
- DATABASE_URL: PostgreSQL connection string
- ASPNETCORE_ENVIRONMENT: Production

## API Endpoints
- /health - Health check
- /api/info - API information
- /swagger - API documentation
