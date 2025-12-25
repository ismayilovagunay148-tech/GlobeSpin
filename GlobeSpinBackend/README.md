# GlobeSpin Backend API

Node.js + Express backend providing country information via REST API for the GlobeSpin iOS app.

## Quick Start

### Install Dependencies
```bash
cd GlobeSpinBackend
npm install
```

### Run Locally
```bash
npm start
```

Server will start on `http://localhost:3000`

## API Endpoints

### Get Single Country
```
GET /country/:name
```
Example: `http://localhost:3000/country/japan`

### Get All Countries
```
GET /countries
```
Example: `http://localhost:3000/countries`

### Health Check
```
GET /health
```
Example: `http://localhost:3000/health`

## Response Format

```json
{
  "country": "Japan",
  "image": "https://...",
  "weather": {
    "temperatureC": 16,
    "temperatureF": 60.8,
    "description": "Humid"
  },
  "funFact": "Japan blends centuries-old traditions...",
  "capital": "Tokyo",
  "locationIcon": "📍"
}
```

## Project Structure

```
GlobeSpinBackend/
├── server.js           # Express server and API routes
├── countriesData.js    # Country data with weather and fun facts
├── package.json        # Dependencies and scripts
├── .gitignore          # Git ignore rules
├── Procfile            # Heroku deployment config
├── render.yaml         # Render deployment config
├── README.md           # This file
├── QUICKSTART.md       # Quick start guide
├── DEPLOYMENT.md       # Full deployment guide
└── DEPLOY_QUICK.md     # Quick deployment steps
```

## Documentation

- **QUICKSTART.md** - Quick start guide for local development
- **DEPLOYMENT.md** - Complete deployment guide for multiple platforms
- **DEPLOY_QUICK.md** - Fast deployment steps

## Deployment

See `DEPLOYMENT.md` for detailed deployment instructions for:
- Render (Recommended - Free tier)
- Railway
- Heroku
- Vercel
- DigitalOcean

Quick deploy to Render:
1. Push code to GitHub
2. Go to https://render.com
3. Create new Web Service
4. Connect GitHub repo
5. Deploy!

## Features

- ✅ RESTful API with Express
- ✅ CORS enabled for iOS app
- ✅ 42+ countries with full data
- ✅ Weather information included
- ✅ Error handling
- ✅ Health check endpoint
- ✅ Ready for deployment

## License

MIT













