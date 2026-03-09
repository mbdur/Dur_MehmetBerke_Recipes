This repository is created by Mehmet Berke Dur (mdur@trinity.edu) for the CSCI3321 Software Engineering Assignment 2.
Class Slides, Claude AI, and Stack Overflow was used for assistance while completing this assignment.

Added extra functionalities: 
    -Expand/collapse protein type sections
    -Click on recipe to go to its individual page

Here's a guide to set this repository up and use the website on your computer:

1 - Clone the repository to your machine: 
    git clone <repo-url>
    cd Recipes

2 - Install dependencies:
    npm install
(You will also need these two installed on your computer)
    Node.js
    MySQL 8.0

3 - Create a .env file in your root folder with this format:
    DATABASE_HOST=localhost
    DATABASE_USER=root
    DATABASE_PASSWORD=yourpassword
    DATABASE_NAME=recipe_site

4 - Set up the database:
    "/c/Program Files/MySQL/MySQL Server 8.0/bin/mysql" -u root -p < db/schema.sql
    OR
    "/c/Program Files/MySQL/MySQL Server 9.6/bin/mysql" -u root -p < db/schema.sql

5 - To run the app:
    node app.js

6 - View in browser:
    http://localhost:3000
    http://localhost:3000/recipes
    http://localhost:3000/recipes/:id
    http://localhost:3000/add-recipe