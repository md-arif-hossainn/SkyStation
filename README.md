# sky_station
Key Features</br>

Login Screen</br>

Implements Firebase anonymous sign-in for seamless user onboarding.
Automatically navigates to the Home Screen upon successful sign-in.</br>

Home Screen </br>

Displays the current latitude and longitude of the ISS retrieved from the ISS Now API.
Shows the UTC and local time of the last data update.
Identifies the country or region above which the ISS is currently located.
Displays a special message if the ISS is above the user's current country:
"The Space Station is above your Country Now!!"
Auto-updates data every minute with a visible countdown timer for the next refresh.
Includes a manual refresh button for instant data updates.</br>

Error Handling</br>

Handles network errors gracefully and displays user-friendly error messages.
Manages both successful and error responses from the API.</br>

Responsiveness </br>

Designed to provide a seamless experience across various Android devices.
Implements a clean and simple UI with appropriate styling.
Technologies and Tools Used
State Management: Bloc pattern for scalable and maintainable state management.</br>
HTTP Requests: Dio package for efficient and robust API integration.</br>
Firebase: Firebase anonymous authentication for user login.</br>
Flutter Test Framework: Unit and widget tests for verifying app functionality.</br>
Geocoding: Integrated to identify the country/region from ISS coordinates.</br>
