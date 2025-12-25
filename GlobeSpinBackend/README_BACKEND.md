## GlobeSpin Backend (Node.js + Express)

This is a simple Node.js + Express backend that serves country information to a Swift iOS app via a REST API.

### 1. Prerequisites

- **Node.js**: v16+ recommended
- **npm**: comes with Node.js
- Optional: an **OpenWeatherMap API key**

### 2. Install Dependencies

From the project root (`GlobeSpin`):

```bash
cd /Users/gunayismayilova/Documents/GitHub/GlobeSpin
npm install
```

### 3. Configure OpenWeatherMap

The backend uses the OpenWeatherMap API to fetch live weather data for each country’s capital.

- Open `server.js` and replace:

```js
const OPENWEATHER_API_KEY = process.env.OPENWEATHER_API_KEY || "YOUR_OPENWEATHER_API_KEY_HERE";
```

with your actual API key **or** set an environment variable:

```bash
export OPENWEATHER_API_KEY=YOUR_REAL_API_KEY
```

If you don’t provide a real API key, the backend will return **dummy but well-formed** weather data, which is still safe for Swift `Codable` parsing.

### 4. Run the Server Locally

```bash
cd /Users/gunayismayilova/Documents/GitHub/GlobeSpin
npm start
```

By default, the server listens on:

- `http://localhost:3000`

### 5. REST Endpoint

- **GET** `http://localhost:3000/country/:name`

Examples:

- `http://localhost:3000/country/japan`
- `http://localhost:3000/country/United%20States`
- `http://localhost:3000/country/spain`

`name` is case-insensitive. The backend normalizes it internally.

#### Response JSON Shape

On success (HTTP 200), the JSON matches:

```json
{
  "country": "Country Name",
  "image": "https://example.com/image.jpg",
  "weather": {
    "temperatureC": 22,
    "temperatureF": 72.5,
    "description": "Sunny"
  },
  "funFact": "Short interesting fact about the country.",
  "capital": "Capital City",
  "locationIcon": "📍"
}
```

On unknown countries (HTTP 404):

```json
{
  "error": "Country not found",
  "message": "No data available for country name: SomeName"
}
```

### 6. Swift Codable Models

Your Swift models can look like this:

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

### 7. Example Swift URLSession Call

```swift
import Foundation

func fetchCountryInfo(name: String, completion: @escaping (Result<CountryInfo, Error>) -> Void) {
    let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? name
    let urlString = "http://localhost:3000/country/\(encodedName)"
    guard let url = URL(string: urlString) else { return }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode),
              let data = data else {
            let statusError = NSError(domain: "GlobeSpinBackend", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid server response"])
            completion(.failure(statusError))
            return
        }

        do {
            let decoder = JSONDecoder()
            let countryInfo = try decoder.decode(CountryInfo.self, from: data)
            completion(.success(countryInfo))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}
```

You can call this from your SwiftUI or UIKit view model / controller and update the UI on the main thread once the result is received.

### 8. CORS Notes

The backend uses a permissive CORS configuration:

- Allows all origins (`*`)
- Allows `GET` requests

This is ideal for local development and for use with `URLSession` in your Swift app.


