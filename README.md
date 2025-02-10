```markdown
# Flask App with MySQL Docker Setup

This is a simple Flask app that interacts with a MySQL database. The app allows users to submit booking information, which is then stored in the database.

## Prerequisites

Before you begin, make sure you have the following installed:

- Docker
- Docker Compose
- Git (optional, for cloning the repository)

## Setup

1. Clone this repository (if you haven't already):

   ```bash
   git clone https://github.com/Bakhtawarkhan90/Moso-Interior.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Moso-Interior
   ```

## Usage

1. Start the containers using Docker Compose:

   ```bash
   docker-compose down
   docker-compose up --build -d
   ```

2. Access the Flask app in your web browser:

   - Backend: [http://localhost:5000](http://localhost:5000)

## To run this APP through Shell-Script in one command
 ```bash
   git clone https://github.com/Bakhtawarkhan90/Moso-Interior.git
   cd Gym && chmod 777 run-app.sh && ./run-app.sh
   ```

## To run this two-tier application without Docker Compose

- First, create a Docker image from Dockerfile:

   ```bash
   docker build . -t moso
   ```

- Now, make sure that you have created a network using the following command:

   ```bash
   docker network create moso
   ```

- Attach both the containers in the same network, so that they can communicate with each other:

i) MySQL container:

   ```bash
   docker run -d \
       --name database \
       -v mysql-data:/var/lib/mysql \
       --network=moso \
       -e MYSQL_DATABASE=moso  \
       -e MYSQL_USER=root \
       -e MYSQL_ROOT_PASSWORD=kali \
       -p 3306:3306 \
       mysql:5.7
   ```

ii) Backend container:

   ```bash
   docker run -d \
       --name moso \
       --network=moso \
       -e MYSQL_HOST=database \
       -e MYSQL_USER=root \
       -e MYSQL_PASSWORD=kali \
       -e MYSQL_DB=moso \
       -p 5000:5000 \
       moso:latest
   ```

3. Access the Flask app in your web browser:

   - Backend: [http://localhost:5000](http://localhost:5000)

4. Command to Create Table in DB:

   ```bash
   CREATE TABLE IF NOT EXISTS booking (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       email VARCHAR(100)
       message TEXT
   );
   ```

## Notes

- Make sure to replace placeholders (e.g., `your_username`, `your_repository`) with your actual MySQL configuration.
- This is a basic setup for demonstration purposes. In a production environment, you should follow best practices for security and performance.
- Be cautious when executing SQL queries directly. Validate and sanitize user inputs to prevent vulnerabilities like SQL injection.
- If you encounter issues, check Docker logs and error messages for troubleshooting.

# WELCOME TO  GYMSO !

## Home Page
![Home Page](./Screenshot%202025-02-10%20225118.png)

## Submission Page
![Sub Page](./Screenshot%202025-01-21%20130331.png)
