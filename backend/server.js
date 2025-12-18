const express = require('express');
const cors = require('cors');
const countries = require('./data/countries');
const { getWeatherForCity } = require('./services/weatherService');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors()); // Enable CORS for all routes
app.use(express.json());

// Helper function to normalize country names for lookup
function normalizeCountryName(name) {
  return name
    .toLowerCase()
    .trim()
    .replace(/\s+/g, ' '); // Normalize whitespace
}

// Helper function to find country by name (case-insensitive, flexible matching)
function findCountry(countryName) {
  const normalized = normalizeCountryName(countryName);
  
  // Try exact match first
  for (const [key, value] of Object.entries(countries)) {
    if (normalizeCountryName(key) === normalized) {
      return { name: key, data: value };
    }
  }
  
  // Try partial match
  for (const [key, value] of Object.entries(countries)) {
    const keyNormalized = normalizeCountryName(key);
    if (keyNormalized.includes(normalized) || normalized.includes(keyNormalized)) {
      return { name: key, data: value };
    }
  }
  
  return null;
}

/**
 * GET /country/:name
 * Returns country information including weather, image, capital, and fun fact
 */
app.get('/country/:name', async (req, res) => {
  try {
    const countryName = req.params.name;
    
    // Find country data
    const countryMatch = findCountry(countryName);
    
    if (!countryMatch) {
      return res.status(404).json({
        error: 'Country not found',
        message: `No information available for "${countryName}". Please check the country name and try again.`
      });
    }

    const { name: countryKey, data: countryData } = countryMatch;
    
    // Extract capital city name (remove country name if present)
    let capitalCity = countryData.capital;
    if (capitalCity.includes(',')) {
      capitalCity = capitalCity.split(',')[0].trim();
    }
    
    // Fetch weather data for the capital city
    const weather = await getWeatherForCity(capitalCity);
    
    // Construct response
    const response = {
      country: countryKey,
      image: countryData.image,
      weather: {
        temperatureC: weather.temperatureC,
        temperatureF: weather.temperatureF,
        description: weather.description
      },
      funFact: countryData.funFact,
      capital: countryData.capital,
      locationIcon: "📍"
    };
    
    res.json(response);
  } catch (error) {
    console.error('Error processing request:', error);
    res.status(500).json({
      error: 'Internal server error',
      message: 'An error occurred while processing your request.'
    });
  }
});

/**
 * GET /health
 * Health check endpoint
 */
app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'Server is running' });
});

/**
 * GET /
 * Root endpoint with API information
 */
app.get('/', (req, res) => {
  res.json({
    message: 'GlobeSpin Backend API',
    version: '1.0.0',
    endpoints: {
      'GET /country/:name': 'Get country information',
      'GET /health': 'Health check'
    },
    example: '/country/United States'
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 GlobeSpin Backend Server running on http://localhost:${PORT}`);
  console.log(`📡 API endpoint: http://localhost:${PORT}/country/:name`);
  console.log(`💡 Example: http://localhost:${PORT}/country/United States`);
  
  if (!process.env.OPENWEATHER_API_KEY || process.env.OPENWEATHER_API_KEY === 'YOUR_API_KEY_HERE') {
    console.log(`⚠️  Warning: OpenWeatherMap API key not configured. Using mock weather data.`);
    console.log(`   Set OPENWEATHER_API_KEY in .env file to use real weather data.`);
  }
});

module.exports = app;

