# GlobeSpin Backend API

A Node.js + Express backend service that provides country information via REST API endpoints. Designed to work seamlessly with Swift iOS apps using URLSession.

## Features

- ✅ REST API endpoint: `GET /country/:name`
- ✅ Returns JSON data compatible with Swift `Codable` structs
- ✅ Includes dummy data for 40+ countries (images, capitals, fun facts)
- ✅ Weather data integration with OpenWeatherMap API
- ✅ CORS enabled for cross-origin requests
- ✅ Error handling for unknown countries
- ✅ Mock weather data fallback when API key is not configured

## API Response Format

The endpoint returns JSON in the following format:

```json
{
  "country": "Country Name",
  "image": "https://example.com/image.jpg",
  "weather": {
    "temperatureC": 22,
    "temperatureF": 72,
    "description": "Sunny"
  },
  "funFact": "Short interesting fact about the country.",
  "capital": "Capital City",
  "locationIcon": "📍"
}
```

## Swift Codable Structs

The JSON response is designed to work with these Swift structs:

```swift
struct CountryInfo: Codable {
    let country: String
    let image: String
    let weather: Weather
    let funFact: String
    let capital: String
    let locationIcon: String
}

struct Weather: Codable {
    let temperatureC: Int
    let temperatureF: Double
    let description: String
}
```

## Setup Instructions

### 1. Install Dependencies

```bash
cd backend
npm install
```

### 2. Configure Environment Variables (Optional)

Copy the example environment file and add your OpenWeatherMap API key:

```bash
cp .env.example .env
```

Then edit `.env` and add your API key:

```
OPENWEATHER_API_KEY=your_actual_api_key_here
```

**Note:** You can get a free API key from [OpenWeatherMap](https://openweathermap.org/api). If you don't set an API key, the server will use mock weather data.

### 3. Start the Server

**Development mode (with auto-reload):**
```bash
npm run dev
```

**Production mode:**
```bash
npm start
```

The server will start on `http://localhost:3000` by default.

## API Endpoints

### GET /country/:name

Get country information by name.

**Example Request:**
```bash
curl http://localhost:3000/country/United%20States
```

**Example Response:**
```json
{
  "country": "United States",
  "image": "https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800",
  "weather": {
    "temperatureC": 22,
    "temperatureF": 72,
    "description": "Sunny"
  },
  "funFact": "The United States has the world's largest economy and is home to the world's first national park (Yellowstone, established in 1872).",
  "capital": "Washington, D.C.",
  "locationIcon": "📍"
}
```

**Error Response (404):**
```json
{
  "error": "Country not found",
  "message": "No information available for \"UnknownCountry\". Please check the country name and try again."
}
```

### GET /health

Health check endpoint.

**Response:**
```json
{
  "status": "ok",
  "message": "Server is running"
}
```

### GET /

API information endpoint.

## Testing with Swift

### Using URLSession

Here's an example of how to fetch data in your Swift app:

```swift
import Foundation

func fetchCountryInfo(countryName: String, completion: @escaping (Result<CountryInfo, Error>) -> Void) {
    // URL encode the country name
    guard let encodedName = countryName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
          let url = URL(string: "http://localhost:3000/country/\(encodedName)") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1)))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: -1)))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let countryInfo = try decoder.decode(CountryInfo.self, from: data)
            completion(.success(countryInfo))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

// Usage
fetchCountryInfo(countryName: "United States") { result in
    switch result {
    case .success(let countryInfo):
        print("Country: \(countryInfo.country)")
        print("Capital: \(countryInfo.capital)")
        print("Temperature: \(countryInfo.weather.temperatureC)°C")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
```

### Important Notes for iOS Development

1. **Localhost Access:** When testing on a physical iOS device, replace `localhost` with your computer's local IP address (e.g., `http://192.168.1.100:3000`).

2. **App Transport Security:** For local development, you may need to add an exception in your `Info.plist`:
   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
       <key>NSAllowsLocalNetworking</key>
       <true/>
   </dict>
   ```

3. **CORS:** The server has CORS enabled, so it will accept requests from your iOS app.

## Available Countries

The backend includes data for 40+ countries including:
- United States, United Kingdom, France, Germany, Italy, Spain
- Japan, China, India, South Korea, Thailand, Vietnam
- Brazil, Canada, Australia, Mexico, Argentina, Chile
- And many more...

Country names are case-insensitive and support partial matching (e.g., "USA" will match "United States").

## Project Structure

```
backend/
├── server.js              # Main Express server
├── package.json           # Dependencies and scripts
├── .env.example          # Environment variables template
├── data/
│   └── countries.js      # Country data (images, capitals, fun facts)
└── services/
    └── weatherService.js # Weather API integration
```

## Dependencies

- **express**: Web framework
- **cors**: Cross-Origin Resource Sharing middleware
- **axios**: HTTP client for weather API requests
- **dotenv**: Environment variable management

## Development

- **nodemon**: Auto-reloads server on file changes (dev dependency)

## License

ISC

