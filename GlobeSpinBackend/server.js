const express = require("express");
const cors = require("cors");
const countriesData = require("./countriesData");

const app = express();
const PORT = process.env.PORT || 3000;

// Basic CORS configuration: allow all origins (suitable for local development)
app.use(
  cors({
    origin: "*",
    methods: ["GET"],
    allowedHeaders: ["Content-Type"]
  })
);

app.use(express.json());

// Helper: normalize country name key
function normalizeCountryName(name) {
  return name.trim().toLowerCase();
}

// Helper: convert weather data from countriesData to API format
function formatWeather(weatherData) {
  const tempC = weatherData.temperature || 22;
  const tempF = parseFloat(((tempC * 9) / 5 + 32).toFixed(1));
  
  return {
    temperatureC: Math.round(tempC),
    temperatureF: tempF,
    description: weatherData.condition || weatherData.description || "Clear"
  };
}

// GET /country/:name
app.get("/country/:name", async (req, res) => {
  const rawName = req.params.name || "";
  const key = normalizeCountryName(rawName);

  const countryEntry = countriesData[key];

  if (!countryEntry) {
    return res.status(404).json({
      error: "Country not found",
      message: `No data available for country name: ${rawName}`
    });
  }

  try {
    // Use weather data from countriesData.js
    const weather = formatWeather(countryEntry.weather);

    const responsePayload = {
      country: countryEntry.country,
      image: countryEntry.image,
      weather,
      funFact: countryEntry.funFact,
      capital: countryEntry.capital,
      locationIcon: "📍"
    };

    // Response is clean JSON that matches the Swift Codable models
    return res.json(responsePayload);
  } catch (error) {
    console.error("Unexpected error in /country route:", error.message);
    return res.status(500).json({
      error: "Internal Server Error",
      message: "An unexpected error occurred while processing your request."
    });
  }
});

// GET /countries - Get all countries with full data
app.get("/countries", (req, res) => {
  try {
    const countries = Object.keys(countriesData).map(key => {
      const countryEntry = countriesData[key];
      const weather = formatWeather(countryEntry.weather);
      
      return {
        country: countryEntry.country,
        image: countryEntry.image,
        weather,
        funFact: countryEntry.funFact,
        capital: countryEntry.capital,
        locationIcon: "📍"
      };
    });
    
    res.json({
      count: countries.length,
      countries: countries
    });
  } catch (error) {
    console.error("Error fetching all countries:", error.message);
    return res.status(500).json({
      error: "Internal Server Error",
      message: "An error occurred while fetching countries."
    });
  }
});

// Simple health check
app.get("/", (req, res) => {
  res.json({ 
    status: "ok", 
    message: "GlobeSpin backend running",
    endpoints: {
      "GET /country/:name": "Get country information by name",
      "GET /countries": "List all available countries",
      "GET /health": "Health check"
    },
    example: "/country/japan"
  });
});

// Health check endpoint
app.get("/health", (req, res) => {
  res.json({ status: "ok", timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`🚀 GlobeSpin backend listening on http://localhost:${PORT}`);
  console.log(`📡 API endpoint: http://localhost:${PORT}/country/:name`);
  console.log(`📋 List countries: http://localhost:${PORT}/countries`);
  console.log(`💡 Example: http://localhost:${PORT}/country/japan`);
});























