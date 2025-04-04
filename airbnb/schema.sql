DROP DATABASE IF EXISTS airbnb_db;

CREATE DATABASE airbnb_db;

USE airbnb_db;

-- Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    account_type ENUM('host', 'guest') NOT NULL,
    signup_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Listings Table
CREATE TABLE listings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    location_city VARCHAR(100) NOT NULL,
    location_country VARCHAR(100) NOT NULL,
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL,
    host_id INT NOT NULL,
    FOREIGN KEY (host_id) REFERENCES users(id)
);

-- Bookings Table
CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    listing_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    booking_status ENUM('confirmed', 'canceled') NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (listing_id) REFERENCES listings(id)
);

-- Reviews Table
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    listing_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (listing_id) REFERENCES listings(id)
);

-- Payments Table
CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status ENUM('paid', 'pending', 'failed', 'refunded') NOT NULL,
    payment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);
    

    