const axios = require('axios');
require('dotenv').config();

const OPENWEATHER_API_KEY = process.env.OPENWEATHER_API_KEY || 'YOUR_API_KEY_HERE';
const OPENWEATHER_BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

/**
 * Fetches weather data for a given city from OpenWeatherMap API
 * @param {string} cityName - Name of the city
 * @returns {Promise<Object>} Weather data with temperatureC, temperatureF, and description
 */
async function getWeatherForCity(cityName) {
  try {
    // If no API key is set, return mock data
    if (!OPENWEATHER_API_KEY || OPENWEATHER_API_KEY === 'YOUR_API_KEY_HERE') {
      console.warn('OpenWeatherMap API key not configured. Using mock weather data.');
      return getMockWeather(cityName);
    }

    const response = await axios.get(OPENWEATHER_BASE_URL, {
      params: {
        q: cityName,
        appid: OPENWEATHER_API_KEY,
        units: 'metric' // Get temperature in Celsius
      }
    });

    const tempC = Math.round(response.data.main.temp);
    const tempF = Math.round((tempC * 9/5) + 32);
    const description = response.data.weather[0].description;

    return {
      temperatureC: tempC,
      temperatureF: tempF,
      description: description.charAt(0).toUpperCase() + description.slice(1)
    };
  } catch (error) {
    console.error(`Error fetching weather for ${cityName}:`, error.message);
    // Return mock data on error
    return getMockWeather(cityName);
  }
}

/**
 * Returns mock weather data when API is unavailable
 * @param {string} cityName - Name of the city
 * @returns {Object} Mock weather data
 */
function getMockWeather(cityName) {
  // Generate consistent mock data based on city name
  const hash = cityName.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0);
  const tempC = 15 + (hash % 20); // Temperature between 15-35°C
  const tempF = Math.round((tempC * 9/5) + 32);
  const descriptions = ['Sunny', 'Partly Cloudy', 'Cloudy', 'Clear', 'Mild'];
  const description = descriptions[hash % descriptions.length];

  return {
    temperatureC: tempC,
    temperatureF: tempF,
    description: description
  };
}

module.exports = {
  getWeatherForCity
};

