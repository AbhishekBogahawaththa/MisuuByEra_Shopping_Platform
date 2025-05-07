-- Create the database
CREATE DATABASE Misuu_by_Eraa;

-- Use the database
USE Misuu_by_Eraa;

-- Create admin table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL -- Store hashed password in real projects
);

-- Create products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    filename VARCHAR(255) -- name of the image file (e.g., product1.jpg)
);
