# Login and Registration System

This project is a simple web application that allows users to register and log in. It includes basic HTML, CSS, and JavaScript for the front end, while the back-end logic is powered by JSP (Java Server Pages) with MySQL for database management.

## Features

- **Login Page**: Allows users to log in using their email and password.
- **Registration Page**: Allows users to create a new account by providing a username, email, and password.
- **Navigation**: Provides a responsive navigation bar with links to Home, About, Services, and Contact pages.
- **Popup Modals**: A dynamic login and registration popup system that lets users switch between login and registration forms without leaving the page.

## Tech Stack

- **Frontend**:
  - HTML
  - CSS
  - JavaScript (for dynamic page behavior)
  - Ionicons (for icons)
  
- **Backend**:
  - JSP (Java Server Pages)
  - MySQL (for user data storage)
  - JDBC (for database connection)
  
## Database

The application uses MySQL as its database system to store user information. The following fields are stored in the `login` table:

- `username`: Stores the username of the user.
- `email`: Stores the email address of the user.
- `userpassword`: Stores the password for user authentication.

Ensure that you have MySQL running on your local machine with the database `users` created. The connection is made using the following details:
- **Host**: `localhost`
- **Database Name**: `users`
- **Username**: `root`
- **Password**: `root`

## Installation

### 1. Clone the repository
Clone the project repository to your local machine.

```bash


2. Set up the database
Ensure that MySQL is installed on your system.
Create a new database users in MySQL.
Create a table login using the following SQL command:

CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    userpassword VARCHAR(255) NOT NULL
);

3. Deploy the application
Place all project files (HTML, CSS, JSP, JavaScript) into your web server's root directory (e.g., Apache Tomcat or similar).
Ensure that you have the MySQL connector JAR file in your lib directory for JDBC connectivity.
Start the server and open the browser to test the application.

Usage
Login: Go to the Login page and enter your credentials (email and password) to log in.
Register: Click on the "Sign up" link on the login form to open the registration page and create a new account.

Project Structure

├── index.html          # Home page
├── About.html          # About page
├── Services.html       # Services page
├── Contact.html        # Contact page
├── Login.jsp           # Login JSP page
├── Registration.jsp    # Registration JSP page
├── style.css           # CSS file for styling
├── script.js           # JavaScript for dynamic behavior
└── WEB-INF/
    └── web.xml         # Web configuration for servlets and mappings

Troubleshooting
Database Connection Issues: Ensure that MySQL is running and the database connection details are correct.
Form Submission Issues: Ensure that you have all the required fields (username, email, password) filled out before submitting the forms.

