# Quick Start Guide - Country Data API

## Prerequisites

Install Node.js (if not already installed):

**macOS (using Homebrew):**
```bash
brew install node
```

**Or download from:** https://nodejs.org/

## Install Dependencies

```bash
cd /Users/gunayismayilova/Documents/GitHub/GlobeSpin
npm install
```

## Run the Server

```bash
npm start
```

The server will start on `http://localhost:3000`

## API Endpoints

### Get Country Information
```
GET http://localhost:3000/country/:name
```

**Example:**
```bash
curl http://localhost:3000/country/japan
curl http://localhost:3000/country/united%20states
```

**Response Format:**
```json
{
  "country": "Japan",
  "image": "https://images.pexels.com/photos/208820/pexels-photo-208820.jpeg",
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

### List All Countries
```
GET http://localhost:3000/countries
```

### Health Check
```
GET http://localhost:3000/health
```

## Testing in Browser

Open these URLs in your browser:
- http://localhost:3000/ (API info)
- http://localhost:3000/country/japan
- http://localhost:3000/countries

## Notes

- The API uses weather data stored in `countriesData.js` (no external API needed)
- Country names are case-insensitive
- Use URL encoding for spaces (e.g., `united%20states`)



