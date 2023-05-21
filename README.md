# Cat Explorer App

The Cat Explorer app is a Flutter application that retrieves data from a simple API to present various cat images and information to the user. The app leverages the powerful Bloc pattern for efficient state management, ensuring a seamless and responsive user experience. The project consists of well-organized folders, including business_logic, constants, data, and presentation, to enhance code maintainability. Additionally, the app features a search functionality that utilizes cat tags obtained from the API. The Dio package is employed for API data retrieval, while flutter_bloc and flutter_offline packages further enhance the app's functionality.

**Key Features:**
- Cat data retrieval: The app fetches cat images and information from a simple API, providing users with an engaging cat exploration experience.
- Bloc-based state management: The project employs the Bloc pattern to manage the app's state, ensuring efficient updates and responsiveness.
- Route management: The "AppRouter" class facilitates seamless navigation by effectively managing routes within the app.
- Search functionality: Users can search for cats based on specific tags, enhancing the exploration and discovery process.
- Dio package integration: The Dio package is utilized to handle API calls and retrieve cat data efficiently.
- Offline detection: The flutter_offline package is used to determine the device's connectivity status. If the device is offline, the app presents a placeholder instead of cats pictures.

**Folder Structure:**
- **business_logic:** Contains classes responsible for implementing the core business logic of the app, including data retrieval and manipulation.
- **constants:** Stores frequently used constants and configurations for easy access and maintenance.
- **data:** Handles data-related operations, including API communication and data parsing.
- **presentation:** Consists of the user interface components, screens, and widgets that enable a visually appealing and intuitive user experience.
Happy cat exploring!

