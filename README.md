# Referee Management Website

This project was developed as part of the **Web Technologies exam**.  
It is a web application that allows referees to manage match-related activities and view reports through a simple, user-friendly interface.

## 📚 Technologies Used

- **Frontend:** HTML, CSS, JavaScript  
- **Backend:** PHP  
- **Database:** PostgreSQL

PHP is used to retrieve and manipulate data directly from the PostgreSQL database.

## 🎯 Features

- View a list of upcoming matches to referee
- Create a match report (referto)
- View existing match reports
- All data is stored and retrieved **exclusively from the database**

## 🧪 How to Test the Application

To properly test the application:

1. **Create a user account** through the registration page  
   > All data is stored locally in your PostgreSQL database.

2. **Populate the database** with sample data, including matches to be refereed  
   > This is essential for testing functionalities like match listing and report creation.

3. **Start the application** by opening the following file in your browser: ProgettoTSW/pages/homepage.php

4. **Access the platform** with your account to:
- View assigned matches
- Submit a match report
- View previously submitted reports

## ⚠️ Notes

- The application does **not** include external authentication services; all accounts and data remain **local** to your PostgreSQL setup.
- Make sure your web server (e.g., Apache) and database server are running and properly configured before launching the application.

---

> Academic project – Web Technologies Course, University
