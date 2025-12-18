// Country data with images, capitals, and fun facts
const countries = {
  "United States": {
    capital: "Washington, D.C.",
    image: "https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800",
    funFact: "The United States has the world's largest economy and is home to the world's first national park (Yellowstone, established in 1872)."
  },
  "United Kingdom": {
    capital: "London",
    image: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800",
    funFact: "The UK has no written constitution and is the only country in the world without one."
  },
  "France": {
    capital: "Paris",
    image: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800",
    funFact: "France is the most visited country in the world, with over 89 million tourists annually."
  },
  "Germany": {
    capital: "Berlin",
    image: "https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=800",
    funFact: "Germany has over 1,500 different types of sausages and is famous for its beer culture."
  },
  "Italy": {
    capital: "Rome",
    image: "https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=800",
    funFact: "Italy has more UNESCO World Heritage sites than any other country in the world (58 sites)."
  },
  "Spain": {
    capital: "Madrid",
    image: "https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800",
    funFact: "Spain has the second-highest number of bars per inhabitant in the world, after Cyprus."
  },
  "Japan": {
    capital: "Tokyo",
    image: "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800",
    funFact: "Japan has more than 50,000 people who are over 100 years old, making it a super-aged society."
  },
  "China": {
    capital: "Beijing",
    image: "https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=800",
    funFact: "China is home to the world's longest wall (Great Wall) and the world's largest population."
  },
  "India": {
    capital: "New Delhi",
    image: "https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800",
    funFact: "India is the world's largest democracy and has the second-largest population, with over 1.4 billion people."
  },
  "Brazil": {
    capital: "Brasília",
    image: "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800",
    funFact: "Brazil is home to the Amazon Rainforest, which produces 20% of the world's oxygen."
  },
  "Canada": {
    capital: "Ottawa",
    image: "https://images.unsplash.com/photo-1519834785169-98be25ec3f84?w=800",
    funFact: "Canada has the longest coastline in the world, stretching over 202,080 kilometers."
  },
  "Australia": {
    capital: "Canberra",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    funFact: "Australia is the only continent that is also a country and an island."
  },
  "Russia": {
    capital: "Moscow",
    image: "https://images.unsplash.com/photo-1513326738677-b964603b136d?w=800",
    funFact: "Russia spans 11 time zones and is the largest country in the world by land area."
  },
  "Mexico": {
    capital: "Mexico City",
    image: "https://images.unsplash.com/photo-1520637836862-4d197d17c93a?w=800",
    funFact: "Mexico introduced chocolate, corn, and chilies to the world."
  },
  "Argentina": {
    capital: "Buenos Aires",
    image: "https://images.unsplash.com/photo-1520106212299-db5e9e7c3443?w=800",
    funFact: "Argentina is the birthplace of the tango dance and has the world's widest avenue (9 de Julio Avenue)."
  },
  "South Africa": {
    capital: "Cape Town",
    image: "https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?w=800",
    funFact: "South Africa has three capital cities: Cape Town (legislative), Pretoria (administrative), and Bloemfontein (judicial)."
  },
  "Egypt": {
    capital: "Cairo",
    image: "https://images.unsplash.com/photo-1539650116574-75c0c6d73a6e?w=800",
    funFact: "The Great Pyramid of Giza is the only one of the Seven Wonders of the Ancient World still standing."
  },
  "Turkey": {
    capital: "Ankara",
    image: "https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800",
    funFact: "Istanbul is the only city in the world located on two continents: Europe and Asia."
  },
  "Greece": {
    capital: "Athens",
    image: "https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800",
    funFact: "Greece has more than 2,000 islands, but only about 170 are inhabited."
  },
  "Netherlands": {
    capital: "Amsterdam",
    image: "https://images.unsplash.com/photo-1534351590666-13e3e96b5017?w=800",
    funFact: "The Netherlands is the most densely populated country in Europe and has more bicycles than people."
  },
  "Sweden": {
    capital: "Stockholm",
    image: "https://images.unsplash.com/photo-1508182314998-3bd49473002f?w=800",
    funFact: "Sweden has a law called 'Allemansrätten' (Right of Public Access) that allows anyone to camp almost anywhere."
  },
  "Norway": {
    capital: "Oslo",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    funFact: "Norway has the longest road tunnel in the world (Lærdal Tunnel, 24.5 km) and experiences the midnight sun."
  },
  "Switzerland": {
    capital: "Bern",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    funFact: "Switzerland has four official languages: German, French, Italian, and Romansh."
  },
  "Poland": {
    capital: "Warsaw",
    image: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800",
    funFact: "Poland is home to the world's largest castle (Malbork Castle) and has the world's oldest salt mine still in operation."
  },
  "Portugal": {
    capital: "Lisbon",
    image: "https://images.unsplash.com/photo-1555881400-74d7acaacd8b?w=800",
    funFact: "Portugal is the oldest nation-state in Europe and was the first global maritime power."
  },
  "Belgium": {
    capital: "Brussels",
    image: "https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=800",
    funFact: "Belgium produces over 220,000 tons of chocolate per year and has the most castles per square kilometer."
  },
  "Austria": {
    capital: "Vienna",
    image: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800",
    funFact: "Austria is the birthplace of many famous composers including Mozart, Beethoven, and Strauss."
  },
  "Denmark": {
    capital: "Copenhagen",
    image: "https://images.unsplash.com/photo-1508182314998-3bd49473002f?w=800",
    funFact: "Denmark is consistently ranked as one of the happiest countries in the world."
  },
  "Finland": {
    capital: "Helsinki",
    image: "https://images.unsplash.com/photo-1508182314998-3bd49473002f?w=800",
    funFact: "Finland has more saunas than cars and is known as the 'Land of a Thousand Lakes' (actually has 188,000 lakes)."
  },
  "Ireland": {
    capital: "Dublin",
    image: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800",
    funFact: "Ireland is the only country in the world with a musical instrument (harp) as its national symbol."
  },
  "Iceland": {
    capital: "Reykjavik",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    funFact: "Iceland has no mosquitoes and uses almost 100% renewable energy for electricity."
  },
  "New Zealand": {
    capital: "Wellington",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
    funFact: "New Zealand has more sheep than people (approximately 6 sheep per person)."
  },
  "South Korea": {
    capital: "Seoul",
    image: "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800",
    funFact: "South Korea has the world's fastest internet speeds and is a global leader in technology innovation."
  },
  "Thailand": {
    capital: "Bangkok",
    image: "https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=800",
    funFact: "Thailand is the only Southeast Asian country never to have been colonized by a European power."
  },
  "Vietnam": {
    capital: "Hanoi",
    image: "https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800",
    funFact: "Vietnam is the world's second-largest coffee exporter and has a unique coffee culture with egg coffee."
  },
  "Indonesia": {
    capital: "Jakarta",
    image: "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800",
    funFact: "Indonesia is the world's largest archipelago with over 17,000 islands and is home to the Komodo dragon."
  },
  "Philippines": {
    capital: "Manila",
    image: "https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=800",
    funFact: "The Philippines consists of 7,641 islands and is one of the world's largest English-speaking countries."
  },
  "Singapore": {
    capital: "Singapore",
    image: "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800",
    funFact: "Singapore is a city-state and one of the world's smallest countries, yet it's a major global financial hub."
  },
  "Malaysia": {
    capital: "Kuala Lumpur",
    image: "https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=800",
    funFact: "Malaysia is one of the world's most biodiverse countries, home to the world's largest flower (Rafflesia)."
  },
  "Chile": {
    capital: "Santiago",
    image: "https://images.unsplash.com/photo-1520106212299-db5e9e7c3443?w=800",
    funFact: "Chile is the longest country in the world from north to south, stretching over 4,300 km."
  },
  "Peru": {
    capital: "Lima",
    image: "https://images.unsplash.com/photo-1520106212299-db5e9e7c3443?w=800",
    funFact: "Peru is home to Machu Picchu, one of the New Seven Wonders of the World, and has over 3,000 varieties of potatoes."
  },
  "Colombia": {
    capital: "Bogotá",
    image: "https://images.unsplash.com/photo-1520106212299-db5e9e7c3443?w=800",
    funFact: "Colombia is the world's leading source of emeralds and has the second-highest biodiversity in the world."
  },
  "Morocco": {
    capital: "Rabat",
    image: "https://images.unsplash.com/photo-1539650116574-75c0c6d73a6e?w=800",
    funFact: "Morocco is home to the world's oldest university (University of Al Quaraouiyine, founded in 859 AD)."
  },
  "Kenya": {
    capital: "Nairobi",
    image: "https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?w=800",
    funFact: "Kenya is the world's leading safari destination and is home to the Great Migration of wildebeest."
  },
  "Saudi Arabia": {
    capital: "Riyadh",
    image: "https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800",
    funFact: "Saudi Arabia has no rivers and is the world's largest oil exporter."
  },
  "United Arab Emirates": {
    capital: "Abu Dhabi",
    image: "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800",
    funFact: "The UAE has the world's tallest building (Burj Khalifa) and is building a city on Mars by 2117."
  },
  "Israel": {
    capital: "Jerusalem",
    image: "https://images.unsplash.com/photo-1539650116574-75c0c6d73a6e?w=800",
    funFact: "Israel has the highest number of museums per capita in the world and is a global leader in technology startups."
  }
};

module.exports = countries;

