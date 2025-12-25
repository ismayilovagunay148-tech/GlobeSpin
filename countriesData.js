// Dummy country data: images, capitals, and fun facts
// Keys are lowercase country names for easier matching.

const countriesData = {
  "united states": {
    country: "United States",
    capital: "Washington, D.C.",
    image: "https://images.pexels.com/photos/1090615/pexels-photo-1090615.jpeg",
    weather: {
      temperature: 14,
      condition: "Temperate",
      description: "Mild temperate climate with four distinct seasons and moderate humidity."
    },
    funFact: "The United States is a federal republic of 50 states stretching from the Atlantic to the Pacific. It is home to a vast range of landscapes, from arid deserts and high mountains to prairies and dense forests. Culturally, it has been a major global influence in technology, entertainment, and politics."
  },
  "canada": {
    country: "Canada",
    capital: "Ottawa",
    image: "https://images.pexels.com/photos/462162/pexels-photo-462162.jpeg",
    weather: {
      temperature: 6,
      condition: "Cold",
      description: "Cool to cold climate with long winters and pleasantly mild summers in many regions."
    },
    funFact: "Canada is the world’s second-largest country by land area and has the longest coastline of any nation. It is officially bilingual in English and French, reflecting its British and French colonial history. The country is also renowned for its national parks and diverse wildlife."
  },
  "mexico": {
    country: "Mexico",
    capital: "Mexico City",
    image: "https://images.pexels.com/photos/167404/pexels-photo-167404.jpeg",
    weather: {
      temperature: 17,
      condition: "Mild",
      description: "High-altitude subtropical climate with generally mild temperatures year-round."
    },
    funFact: "Mexico has a rich blend of Indigenous and Spanish heritage that shapes its language, festivals, and cuisine. It is the birthplace of ancient civilizations such as the Maya and Aztec. The country is also famous for its vibrant art scene, including the works of Frida Kahlo and Diego Rivera."
  },
  "brazil": {
    country: "Brazil",
    capital: "Brasília",
    image: "https://images.pexels.com/photos/586030/pexels-photo-586030.jpeg",
    weather: {
      temperature: 22,
      condition: "Warm",
      description: "Warm tropical to subtropical climate with relatively mild seasonal variation."
    },
    funFact: "Brazil is the largest country in South America and is known for its diverse ecosystems, including the Amazon rainforest. Its culture is famous for samba music, Carnival celebrations, and passionate football traditions. The capital, Brasília, is a planned city recognized for its modernist architecture."
  },
  "argentina": {
    country: "Argentina",
    capital: "Buenos Aires",
    image: "https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg",
    weather: {
      temperature: 18,
      condition: "Mild",
      description: "Temperate climate with warm summers and cool, often humid winters."
    },
    funFact: "Argentina is known for its gaucho (cowboy) culture and vast Pampas grasslands. Buenos Aires is often called the “Paris of South America” for its European-style architecture and café culture. The country is also famous for tango music and dance, which originated in its capital."
  },
  "chile": {
    country: "Chile",
    capital: "Santiago",
    image: "https://images.pexels.com/photos/1446076/pexels-photo-1446076.jpeg",
    weather: {
      temperature: 16,
      condition: "Mild",
      description: "Mediterranean-style climate with dry summers and cool, wet winters."
    },
    funFact: "Chile stretches along the western edge of South America, giving it one of the longest north–south spans of any country. It contains a remarkable variety of landscapes, from the Atacama Desert in the north to Patagonia in the south. Chile is also a world leader in astronomy, hosting many major observatories."
  },
  "peru": {
    country: "Peru",
    capital: "Lima",
    image: "https://images.pexels.com/photos/2362730/pexels-photo-2362730.jpeg",
    weather: {
      temperature: 19,
      condition: "Mild",
      description: "Coastal desert climate with mild temperatures and high humidity throughout the year."
    },
    funFact: "Peru was the heart of the Inca Empire, and its history is still visible in sites like Machu Picchu and Cusco. The country’s geography ranges from Pacific coastline to high Andes and Amazon rainforest. It is also known for its diverse cuisine, including ceviche and quinoa-based dishes."
  },
  "united kingdom": {
    country: "United Kingdom",
    capital: "London",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 12,
      condition: "Cloudy",
      description: "Temperate maritime climate with frequent cloud cover and light rain."
    },
    funFact: "The United Kingdom is made up of England, Scotland, Wales, and Northern Ireland, each with its own distinct identity. London has been an important financial and cultural center for centuries. The UK has a constitutional monarchy and a long parliamentary tradition that has influenced many democracies."
  },
  "france": {
    country: "France",
    capital: "Paris",
    image: "https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg",
    weather: {
      temperature: 12,
      condition: "Mild",
      description: "Temperate climate with cool winters and warm, pleasant summers."
    },
    funFact: "France is renowned for its art, fashion, and culinary traditions, from haute cuisine to everyday baguettes and cheese. Paris has been a major center for artists, writers, and philosophers for centuries. The country also has a diverse landscape that includes beaches, mountains, vineyards, and historic villages."
  },
  "germany": {
    country: "Germany",
    capital: "Berlin",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 10,
      condition: "Cool",
      description: "Temperate seasonal climate with warm summers and cold winters."
    },
    funFact: "Germany is known for its engineering, automotive industry, and strong emphasis on vocational education. Berlin has a rich history, from the Prussian era to the Cold War and modern reunification. The country is also home to famous cultural traditions like Oktoberfest and classical music heritage from composers such as Bach and Beethoven."
  },
  "italy": {
    country: "Italy",
    capital: "Rome",
    image: "https://images.pexels.com/photos/533924/pexels-photo-533924.jpeg",
    weather: {
      temperature: 18,
      condition: "Sunny",
      description: "Mediterranean climate with hot, dry summers and mild, wetter winters."
    },
    funFact: "Italy was the center of the Roman Empire, which left an enduring legacy in law, architecture, and language. The country is also the birthplace of the Renaissance, producing artists like Leonardo da Vinci and Michelangelo. Italian cuisine, from pasta and pizza to gelato, is popular worldwide."
  },
  "spain": {
    country: "Spain",
    capital: "Madrid",
    image: "https://images.pexels.com/photos/5621021/pexels-photo-5621021.jpeg",
    weather: {
      temperature: 18,
      condition: "Sunny",
      description: "Continental Mediterranean climate with hot summers and cool winters."
    },
    funFact: "Spain has a rich cultural history influenced by Roman, Islamic, and Christian civilizations. Its regions, such as Catalonia and Andalusia, have distinct languages, traditions, and festivals. Spanish art and literature have produced figures like Pablo Picasso, Salvador Dalí, and Miguel de Cervantes."
  },
  "portugal": {
    country: "Portugal",
    capital: "Lisbon",
    image: "https://images.pexels.com/photos/1005417/pexels-photo-1005417.jpeg",
    weather: {
      temperature: 17,
      condition: "Sunny",
      description: "Mild maritime climate with warm, dry summers and rainy winters."
    },
    funFact: "Portugal was a major seafaring nation during the Age of Discoveries, exploring routes to Africa, Asia, and South America. Its historic cities, such as Lisbon and Porto, are known for colorful buildings and traditional azulejo tiles. The country is also famous for fado music and port wine."
  },
  "netherlands": {
    country: "Netherlands",
    capital: "Amsterdam",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 11,
      condition: "Cloudy",
      description: "Moderate maritime climate with frequent clouds, rain, and mild temperatures."
    },
    funFact: "The Netherlands has an extensive system of canals, dikes, and polders that protect low-lying land from the sea. Bicycles are a primary mode of transport in many Dutch cities, with dedicated cycling infrastructure. The country is also known for its windmills, tulip fields, and contributions to art through painters like Rembrandt and Van Gogh."
  },
  "belgium": {
    country: "Belgium",
    capital: "Brussels",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 11,
      condition: "Cloudy",
      description: "Temperate maritime climate with mild temperatures and frequent rainfall."
    },
    funFact: "Belgium is home to the headquarters of the European Union and NATO, making Brussels an important political center. The country is linguistically diverse, with Dutch, French, and German as official languages. It is also celebrated for its chocolate, waffles, comic art, and extensive beer traditions."
  },
  "switzerland": {
    country: "Switzerland",
    capital: "Bern",
    image: "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg",
    weather: {
      temperature: 10,
      condition: "Cool",
      description: "Temperate climate with cold winters in the mountains and mild summers in the lowlands."
    },
    funFact: "Switzerland is famous for its political neutrality and has not taken part in a major armed conflict for centuries. The country’s Alps attract visitors for skiing, hiking, and scenic train journeys. It is also known for precision industries such as watchmaking and banking."
  },
  "austria": {
    country: "Austria",
    capital: "Vienna",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 11,
      condition: "Mild",
      description: "Temperate continental climate with warm summers and cold, snowy winters."
    },
    funFact: "Austria has a strong musical heritage, being the home of composers like Mozart, Haydn, and Strauss. Vienna’s coffeehouse culture and grand architecture reflect its history as the capital of the Habsburg Empire. The country’s Alpine region is also a popular destination for winter sports and mountain tourism."
  },
  "sweden": {
    country: "Sweden",
    capital: "Stockholm",
    image: "https://images.pexels.com/photos/41004/pexels-photo-41004.jpeg",
    weather: {
      temperature: 7,
      condition: "Cool",
      description: "Cool temperate climate with cold winters and mild to warm summers."
    },
    funFact: "Sweden is known for its high standard of living and strong social welfare system. The country has a long tradition of design and innovation, seen in everything from furniture to technology companies. Swedish culture values nature, and the concept of “allemansrätten” grants public access to the countryside."
  },
  "norway": {
    country: "Norway",
    capital: "Oslo",
    image: "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg",
    weather: {
      temperature: 6,
      condition: "Cool",
      description: "Cool temperate climate with snowy winters and relatively mild coastal areas."
    },
    funFact: "Norway is famous for its dramatic fjords carved by glaciers along the North Atlantic coastline. The country generates most of its electricity from hydropower and places a strong emphasis on environmental sustainability. It is also known for its Viking heritage and as the home of the Nobel Peace Prize ceremony."
  },
  "denmark": {
    country: "Denmark",
    capital: "Copenhagen",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 9,
      condition: "Cloudy",
      description: "Oceanic climate with mild winters, cool summers, and frequent overcast skies."
    },
    funFact: "Denmark often ranks among the happiest countries in the world, supported by strong social services and work–life balance. Copenhagen is renowned for its cycling culture, modern architecture, and historic harbor. Danish design principles emphasizing simplicity and functionality are influential globally."
  },
  "finland": {
    country: "Finland",
    capital: "Helsinki",
    image: "https://images.pexels.com/photos/41004/pexels-photo-41004.jpeg",
    weather: {
      temperature: 6,
      condition: "Cold",
      description: "Cold winters with snow and relatively mild, bright summers."
    },
    funFact: "Finland is known for its thousands of lakes and vast forests, which cover most of its land area. The concept of sauna is deeply embedded in Finnish culture, with more saunas than cars in the country. Finland also scores highly in education and innovation rankings."
  },
  "iceland": {
    country: "Iceland",
    capital: "Reykjavík",
    image: "https://images.pexels.com/photos/462162/pexels-photo-462162.jpeg",
    weather: {
      temperature: 5,
      condition: "Cool",
      description: "Cool oceanic climate with relatively mild winters and cool summers."
    },
    funFact: "Iceland sits on the Mid-Atlantic Ridge, making it a land of volcanoes, geysers, and geothermal hot springs. Almost all of its electricity and heating come from renewable sources, primarily geothermal and hydropower. The country also has a rich storytelling tradition rooted in medieval sagas."
  },
  "russia": {
    country: "Russia",
    capital: "Moscow",
    image: "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg",
    weather: {
      temperature: 5,
      condition: "Cold",
      description: "Continental climate with long, cold winters and warm, often short summers."
    },
    funFact: "Russia spans eleven time zones and covers more territory than any other country on Earth. Its history includes the era of the tsars, the Soviet period, and a modern federal republic. Russian culture is famous for its literature, classical music, ballet, and distinctive architecture such as onion-domed churches."
  },
  "china": {
    country: "China",
    capital: "Beijing",
    image: "https://images.pexels.com/photos/161902/big-wall-of-china-china-travel-161902.jpeg",
    weather: {
      temperature: 13,
      condition: "Continental",
      description: "Monsoon-influenced continental climate with hot summers and cold, dry winters."
    },
    funFact: "China has one of the world’s oldest continuous civilizations, with recorded history stretching back thousands of years. It has contributed major inventions such as paper, gunpowder, and the compass. The country’s cultural diversity is reflected in its many languages, cuisines, and regional traditions."
  },
  "japan": {
    country: "Japan",
    capital: "Tokyo",
    image: "https://images.pexels.com/photos/208820/pexels-photo-208820.jpeg",
    weather: {
      temperature: 16,
      condition: "Humid",
      description: "Humid subtropical climate with hot summers and mild winters, influenced by ocean currents."
    },
    funFact: "Japan is an island nation with a blend of ancient traditions and cutting-edge technology. Its culture includes tea ceremonies, sumo wrestling, and anime, alongside centuries-old temples and shrines. Tokyo is one of the world’s largest metropolitan areas and a global economic hub."
  },
  "south korea": {
    country: "South Korea",
    capital: "Seoul",
    image: "https://images.pexels.com/photos/237211/pexels-photo-237211.jpeg",
    weather: {
      temperature: 12,
      condition: "Temperate",
      description: "Temperate climate with hot, humid summers and cold, dry winters."
    },
    funFact: "South Korea has rapidly transformed into a high-tech, highly urbanized society within a few decades. It is known for its global influence in pop culture through K-pop, cinema, and TV dramas. The country also has a strong education system and a major presence in electronics and automobile manufacturing."
  },
  "india": {
    country: "India",
    capital: "New Delhi",
    image: "https://images.pexels.com/photos/356830/pexels-photo-356830.jpeg",
    weather: {
      temperature: 25,
      condition: "Hot",
      description: "Subtropical climate with very hot summers, a monsoon rainy season, and cooler winters."
    },
    funFact: "India is the world’s largest democracy and one of the most linguistically diverse countries, with hundreds of languages spoken. Its history includes ancient urban civilizations, powerful empires, and rich philosophical and religious traditions. The country is also renowned for its cuisine, classical music, and Bollywood film industry."
  },
  "pakistan": {
    country: "Pakistan",
    capital: "Islamabad",
    image: "https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg",
    weather: {
      temperature: 21,
      condition: "Warm",
      description: "Subtropical climate with hot summers and cooler winters, moderated by elevation in some areas."
    },
    funFact: "Pakistan’s landscape ranges from coastal plains to deserts and some of the world’s highest mountain peaks. Its cultural heritage is shaped by ancient Indus Valley sites, Islamic traditions, and regional languages. The country has a rich legacy in poetry, music, and handcrafted textiles."
  },
  "bangladesh": {
    country: "Bangladesh",
    capital: "Dhaka",
    image: "https://images.pexels.com/photos/356830/pexels-photo-356830.jpeg",
    weather: {
      temperature: 26,
      condition: "Humid",
      description: "Tropical monsoon climate with hot, humid summers and a pronounced rainy season."
    },
    funFact: "Bangladesh is built around a vast network of rivers, forming one of the world’s largest river deltas. Its fertile land supports intensive agriculture, including rice and jute production. The country also has a growing textile and garment industry that plays a major role in its economy."
  },
  "sri lanka": {
    country: "Sri Lanka",
    capital: "Sri Jayawardenepura Kotte",
    image: "https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg",
    weather: {
      temperature: 27,
      condition: "Tropical",
      description: "Tropical climate with warm temperatures year-round and seasonal monsoon rains."
    },
    funFact: "Sri Lanka has a history that spans ancient kingdoms, colonial rule, and modern independence. It is known for its tea plantations, scenic highlands, and diverse wildlife, including elephants and leopards. The island’s cultural heritage includes Buddhist temples, traditional dance, and colorful festivals."
  },
  "indonesia": {
    country: "Indonesia",
    capital: "Jakarta",
    image: "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg",
    weather: {
      temperature: 27,
      condition: "Tropical",
      description: "Equatorial tropical climate with high humidity and little seasonal temperature change."
    },
    funFact: "Indonesia is the world’s largest archipelago, consisting of thousands of islands spread across Southeast Asia. It is home to many ethnic groups and languages, creating a highly diverse cultural landscape. The country also sits on the Pacific Ring of Fire, resulting in numerous volcanoes and rich soils."
  },
  "thailand": {
    country: "Thailand",
    capital: "Bangkok",
    image: "https://images.pexels.com/photos/237272/pexels-photo-237272.jpeg",
    weather: {
      temperature: 29,
      condition: "Hot",
      description: "Tropical savanna climate with hot temperatures and a distinct rainy season."
    },
    funFact: "Thailand is the only Southeast Asian country never colonized by a European power, preserving its monarchy and cultural continuity. It is known for ornate temples, bustling markets, and a world-famous cuisine that balances sweet, sour, salty, and spicy flavors. Tourism plays a major role in its economy, with destinations ranging from beaches to mountain villages."
  },
  "vietnam": {
    country: "Vietnam",
    capital: "Hanoi",
    image: "https://images.pexels.com/photos/1322062/pexels-photo-1322062.jpeg",
    weather: {
      temperature: 24,
      condition: "Humid",
      description: "Humid subtropical climate in the north with warm summers and cooler, drier winters."
    },
    funFact: "Vietnam has a long history shaped by indigenous kingdoms, Chinese influence, colonialism, and struggles for independence. Its landscapes range from terraced rice fields and limestone karsts to long coastlines and deltas. Vietnamese cuisine, including dishes like pho and bánh mì, has become popular around the world."
  },
  "singapore": {
    country: "Singapore",
    capital: "Singapore",
    image: "https://images.pexels.com/photos/219692/pexels-photo-219692.jpeg",
    weather: {
      temperature: 27,
      condition: "Humid",
      description: "Equatorial climate with consistently warm temperatures and high humidity all year."
    },
    funFact: "Singapore is both a city and a country, known for its efficient public services and strict urban planning. It is a major global financial and shipping hub despite its small size. The city-state is also celebrated for its clean streets, multicultural society, and vibrant food hawker culture."
  },
  "australia": {
    country: "Australia",
    capital: "Canberra",
    image: "https://images.pexels.com/photos/2193300/pexels-photo-2193300.jpeg",
    weather: {
      temperature: 14,
      condition: "Mild",
      description: "Temperate climate in the southeast with warm summers and cool winters."
    },
    funFact: "Australia is both a country and a continent, with ecosystems ranging from deserts to tropical rainforests. Its unique wildlife includes kangaroos, koalas, and many species found nowhere else. The capital, Canberra, was purpose-built to serve as a compromise between Sydney and Melbourne."
  },
  "new zealand": {
    country: "New Zealand",
    capital: "Wellington",
    image: "https://images.pexels.com/photos/462162/pexels-photo-462162.jpeg",
    weather: {
      temperature: 12,
      condition: "Windy",
      description: "Maritime temperate climate with moderate temperatures and frequent winds."
    },
    funFact: "New Zealand has a strong Māori cultural presence that shapes its language, art, and national identity. Its dramatic landscapes, from fjords to rolling hills, have made it a popular filming location for fantasy movies. The country is also known for adventure tourism and outdoor sports."
  },
  "south africa": {
    country: "South Africa",
    capital: "Pretoria",
    image: "https://images.pexels.com/photos/106133/pexels-photo-106133.jpeg",
    weather: {
      temperature: 17,
      condition: "Warm",
      description: "Subtropical highland climate with warm summers and mild, dry winters."
    },
    funFact: "South Africa is sometimes called the “Rainbow Nation” for its cultural and ethnic diversity. It has three official capital cities, each hosting a different branch of government. The country is also rich in mineral resources and is famous for its national parks and wildlife reserves."
  },
  "egypt": {
    country: "Egypt",
    capital: "Cairo",
    image: "https://images.pexels.com/photos/161902/big-wall-of-china-china-travel-161902.jpeg",
    weather: {
      temperature: 22,
      condition: "Dry",
      description: "Hot desert climate with very little rainfall and mild winters."
    },
    funFact: "Egypt is home to one of the world’s earliest and most influential civilizations, centered along the Nile River. Monumental structures like the pyramids and temples at Luxor continue to fascinate archaeologists and visitors. The country has also played an important role in modern Middle Eastern history and culture."
  },
  "nigeria": {
    country: "Nigeria",
    capital: "Abuja",
    image: "https://images.pexels.com/photos/1435075/pexels-photo-1435075.jpeg",
    weather: {
      temperature: 27,
      condition: "Hot",
      description: "Tropical savanna climate with a marked dry season and a rainy season."
    },
    funFact: "Nigeria is Africa’s most populous country and has hundreds of ethnic groups, including Hausa, Yoruba, and Igbo. Its film industry, often called Nollywood, is one of the largest in the world by number of productions. The country also has a vibrant music scene influencing genres across the continent."
  },
  "kenya": {
    country: "Kenya",
    capital: "Nairobi",
    image: "https://images.pexels.com/photos/106133/pexels-photo-106133.jpeg",
    weather: {
      temperature: 18,
      condition: "Mild",
      description: "Highland climate with mild temperatures and two rainy seasons each year."
    },
    funFact: "Kenya is globally associated with wildlife safaris and protected areas such as the Maasai Mara. The country is also renowned for producing world-class long-distance runners. Its culture blends modern urban life with the traditions of many ethnic communities, including the Maasai and Kikuyu."
  },
  "ethiopia": {
    country: "Ethiopia",
    capital: "Addis Ababa",
    image: "https://images.pexels.com/photos/106133/pexels-photo-106133.jpeg",
    weather: {
      temperature: 16,
      condition: "Mild",
      description: "Highland subtropical climate with relatively mild temperatures year-round."
    },
    funFact: "Ethiopia has its own ancient script and calendar, making it unique among African nations. It is one of the few African countries that was never colonized, aside from a brief occupation. The country is also known for its coffee origins, rock-hewn churches, and long-distance running champions."
  },
  "turkey": {
    country: "Turkey",
    capital: "Ankara",
    image: "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg",
    weather: {
      temperature: 12,
      condition: "Continental",
      description: "Continental climate with hot, dry summers and cold, snowy winters."
    },
    funFact: "Turkey bridges Europe and Asia, giving it a unique position in trade and culture. Its history encompasses Hittite, Greek, Roman, Byzantine, and Ottoman civilizations. Modern Turkey blends historic sites like Cappadocia and Ephesus with bustling cities such as Istanbul and Ankara."
  },
  "greece": {
    country: "Greece",
    capital: "Athens",
    image: "https://images.pexels.com/photos/533924/pexels-photo-533924.jpeg",
    weather: {
      temperature: 19,
      condition: "Sunny",
      description: "Mediterranean climate with hot, dry summers and mild, wet winters."
    },
    funFact: "Greece is often called the cradle of Western civilization, contributing ideas in democracy, philosophy, and theater. Ancient sites such as the Acropolis and Delphi attract visitors from around the world. Greek culture is also celebrated for its food, music, and island traditions."
  },
  "ireland": {
    country: "Ireland",
    capital: "Dublin",
    image: "https://images.pexels.com/photos/462162/pexels-photo-462162.jpeg",
    weather: {
      temperature: 9,
      condition: "Cloudy",
      description: "Mild oceanic climate with frequent clouds, rain, and relatively small temperature variations."
    },
    funFact: "Ireland is known as the “Emerald Isle” for its lush green landscapes, shaped by abundant rainfall. Its cultural heritage includes traditional music, dance, and storytelling, as well as influential writers like James Joyce and W.B. Yeats. Gaelic sports such as hurling and Gaelic football are central to many communities."
  },
  "poland": {
    country: "Poland",
    capital: "Warsaw",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 9,
      condition: "Cool",
      description: "Temperate climate with cold winters and warm summers, influenced by both maritime and continental air masses."
    },
    funFact: "Poland has a complex history of partitions, occupations, and eventual post–Cold War independence. Its cities, such as Kraków and Gdańsk, showcase Gothic, Renaissance, and Baroque architecture. The country is also known for its contributions to science and culture, including figures like Nicolaus Copernicus and Marie Curie."
  },
  "czech republic": {
    country: "Czech Republic",
    capital: "Prague",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 9,
      condition: "Mild",
      description: "Temperate continental climate with warm summers and cold, often snowy winters."
    },
    funFact: "The Czech Republic is a landlocked country in Central Europe known for its historic castles and medieval towns. Prague, its capital, is often called the “City of a Hundred Spires” and has a well-preserved Old Town. The country has a long tradition of brewing and is among the world’s top beer consumers per capita."
  },
  "hungary": {
    country: "Hungary",
    capital: "Budapest",
    image: "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg",
    weather: {
      temperature: 11,
      condition: "Mild",
      description: "Continental climate with hot summers and cold winters along the Danube basin."
    },
    funFact: "Hungary’s capital, Budapest, is divided by the Danube River into the historic Buda and the more modern Pest. The country is known for its thermal baths, many of which date back to Roman and Ottoman times. Hungarian cuisine, including goulash and paprika-spiced dishes, reflects Central European and regional influences."
  },
  "uae": {
    country: "United Arab Emirates",
    capital: "Abu Dhabi",
    image: "https://images.pexels.com/photos/219692/pexels-photo-219692.jpeg",
    weather: {
      temperature: 28,
      condition: "Hot",
      description: "Hot desert climate with extremely hot summers and warm, dry winters."
    },
    funFact: "The United Arab Emirates transformed rapidly from a collection of desert sheikhdoms into a modern, urbanized federation. Its cities, such as Dubai and Abu Dhabi, feature futuristic skylines and ambitious engineering projects. The UAE is also a major regional center for aviation, trade, and tourism."
  },
  "saudi arabia": {
    country: "Saudi Arabia",
    capital: "Riyadh",
    image: "https://images.pexels.com/photos/753626/pexels-photo-753626.jpeg",
    weather: {
      temperature: 27,
      condition: "Hot",
      description: "Hot desert climate with very high summer temperatures and mild winters."
    },
    funFact: "Saudi Arabia is the birthplace of Islam and home to its two holiest cities, Mecca and Medina, which attract millions of pilgrims each year. The country’s economy has long been based on oil production, though it is diversifying through programs like Vision 2030. Traditional customs coexist with rapid modernization in its major cities."
  }
};

module.exports = countriesData;


