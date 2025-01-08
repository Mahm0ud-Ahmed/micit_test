# MICIT Task

## Screenshots

### Viedo
https://github.com/user-attachments/assets/d605d239-9845-487e-be04-3f9ee45749d2

### Images
<p>
    <img src="https://github.com/user-attachments/assets/5045524d-b214-42f5-9bc1-ca42bb5b91aa" width="250" />
    <img src="https://github.com/user-attachments/assets/46fb3ac0-119b-41f4-88a5-3943c4c634d1" width="250" />
    <img src="https://github.com/user-attachments/assets/90bc497b-4fbd-4844-9d95-a28a79c3c495" width="250" />
    <img src="https://github.com/user-attachments/assets/37f4b70d-0754-4ab4-90fb-02b35de22e9b" width="250" />
</p>

## App Features
Flutter Task: Google Authentication, Fetching Users, and Data Caching
Task Overview:
You are required to create a Flutter app with the following features:
1. Google Authentication: Use Firebase for Google Sign-In.
2. Fetch Users from API: After login, fetch users from Reqres API.
3. Cache Users using SQLite: Store the fetched users locally using the sqflite package.
4. Edit User Data: Provide functionality to edit user data (first name, last name, email).
5. Add New User: Provide functionality to add a new user to the cached data (fields: email, first name,
last name, image from assets).
6. Delete User: Provide functionality to delete a user from the cached data.

Steps and Requirements:
1. Google Authentication
• Integrate Firebase into the project.
• Implement Google Sign-In using Firebase Authentication.
• Upon successful login, navigate to the users list screen.
2. Fetching Users from API
• After logging in, make an HTTP GET request to the Reqres API to fetch the list of users.
• Display the fetched users in a list.
3. Caching Users Using SQLite (sqflite)
• Use the sqflite package to cache the fetched users locally on the device.
• Upon app restart, display the cached users from SQLite if the network is unavailable.
4. Edit User Data
• Add an Edit button next to each user.
• When clicked, allow editing of the user's first name, last name, and email.
• Update the cached data after editing.

5. Add New User
• Add an Add User button that opens a form to input first name, last name, email, and an image
(image stored in the app's assets).
• Store this new user in the SQLite database and refresh the list of cached users.
6. Delete User
• Add a Delete button next to each user.
• When clicked, delete the user from the cached data (SQLite database) and update the UI.

Technical Requirements:
1. Flutter Packages:
o firebase_auth: For Google Authentication.
o google_sign_in: For Google Sign-In.
o Dio: To fetch data from the Reqres API.
o sqflite: To cache users locally in SQLite.
o Bloc: For state management.
2. UI:
o Simple and clean user interface.
o Display users in a list.
o Provide buttons for editing, adding, and deleting users.
3. Error Handling:
o Handle errors for network requests (e.g., when fetching users).
o Handle cases when the user edits or deletes non-existing users or any edge cases with the
SQLite database.
• Implement data synchronization: If the API data changes, update the SQLite cache accordingly when
the user logs back in.
