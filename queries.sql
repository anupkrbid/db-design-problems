-- Queries



-- Basic CRUD Operations


-- Insert sample data into all tables.
INSERT INTO users (full_name, email, phone_number, account_type) VALUES ("dummy data", "dummy@email.com", "24312312312", "host");

-- Retrieve data using SELECT statements.
SELECT * FROM users;
SELECT * FROM listings;
SELECT * FROM bookings;
SELECT * FROM reviews;
SELECT * FROM payments;

-- Update existing records.
UPDATE payments 
SET 
    amount_paid = 2000
WHERE
    id = 7;

-- Delete specific records.
DELETE FROM users 
WHERE
    id = 9;



-- Filtering and Sorting


SELECT 
    l.id, l.title, l.location_city, l.location_country
FROM
    listings AS l
WHERE
    location_city = 'New York';

-- List all properties sorted by price (ascending and descending).
SELECT 
    l.id,
    l.title,
    l.location_city,
    l.location_country,
    l.price_per_night
FROM
    listings AS l
ORDER BY price_per_night ASC;

SELECT 
    l.id,
    l.title,
    l.location_city,
    l.location_country,
    l.price_per_night
FROM
    listings AS l
ORDER BY price_per_night DESC;

-- Get bookings for a particular user.
SELECT 
    *
FROM
    bookings AS b
WHERE
    b.guest_id = 1;

-- Find properties within a specific price range.
SELECT 
    *
FROM
    listings AS l
WHERE
    l.price_per_night BETWEEN 100 AND 200;



-- Aggregations and Grouping


-- Count total listings per city.
SELECT 
    location_city, COUNT(*) AS listing_count
FROM
    listings
GROUP BY location_city
ORDER BY listing_count DESC;

-- Find the average rating of each listing.
SELECT 
    l.id, l.title, AVG(r.rating) AS avg_rating
FROM
    listings AS l
        JOIN
    reviews AS r ON l.id = r.listing_id
GROUP BY r.listing_id;

-- Get the total revenue earned by each host.
SELECT 
    u.id, u.full_name, SUM(p.amount_paid) AS total_revinue
FROM
    users AS u
        JOIN
    listings AS l ON u.id = l.host_id
        JOIN
    bookings AS b ON b.listing_id = l.id
        JOIN
    payments AS p ON b.id = p.booking_id
WHERE
    p.payment_status = 'paid'
GROUP BY u.id
ORDER BY total_revinue DESC;

-- Show the number of bookings per month.
SELECT 
    MONTH(start_date) AS month,
    YEAR(start_date) AS year,
    COUNT(id) AS booking_count
FROM
    bookings
GROUP BY month , year
ORDER BY year DESC , month DESC;  



-- Joins and Subqueries


-- Retrieve all bookings along with guest and listing details.
SELECT 
    *
FROM
    bookings AS b
        JOIN
    users AS u ON b.guest_id = u.id
        JOIN
    listings AS l ON l.id = b.listing_id
ORDER BY b.start_date DESC;

-- Show listings with their average rating (using JOIN).
SELECT 
    l.id,
    l.title,
    location_city,
    l.location_country,
    AVG(r.rating) AS avg_rating
FROM
    listings AS l
        JOIN
    reviews AS r ON l.id = r.listing_id
GROUP BY l.id
ORDER BY avg_rating DESC; 

-- Find hosts who have never received a booking.
SELECT 
    u.id, u.full_name, COUNT(b.id) AS total_bookings
FROM
    users AS u
        JOIN
    listings AS l ON u.id = l.host_id
        JOIN
    bookings AS b ON l.id = b.listing_id
GROUP BY u.id
HAVING total_bookings = 0;

-- Get the most booked property in the database.
SELECT 
    l.id, l.title, COUNT(l.id) AS listing_count
FROM
    listings AS l
        JOIN
    bookings AS b ON b.listing_id = l.id
GROUP BY l.id
ORDER BY listing_count DESC
LIMIT 1;



-- Advanced Queries


-- Retrieve all guests who have spent more than $1000 in total bookings.
SELECT 
    u.id, u.full_name, SUM(p.amount_paid) AS total_spending
FROM
    users AS u
        JOIN
    bookings AS b ON b.guest_id = u.id
        JOIN
    payments AS p ON b.id = p.booking_id
GROUP BY u.id
HAVING total_spending > 1000
ORDER BY total_spending DESC;

-- Find listings that have never been reviewed.
SELECT 
    l.id, l.title, COUNT(r.id) AS review_count
FROM
    listings AS l
        LEFT JOIN
    reviews AS r ON l.id = r.listing_id
GROUP BY l.id
HAVING review_count = 0;

-- Get the top 3 highest-rated properties.
SELECT 
    l.id,
    l.title,
    l.location_city,
    AVG(r.rating) AS avg_rating,
    COUNT(r.id) AS total_reviews
FROM
    listings AS l
        JOIN
    reviews AS r ON r.listing_id = l.id
GROUP BY l.id
ORDER BY avg_rating DESC, total_reviews DESC
LIMIT 3;

-- List the most active guests (users who made the most bookings).
SELECT 
    u.id, u.full_name, COUNT(b.id) AS booking_count
FROM
    users AS u
        JOIN
    bookings AS b ON u.id = b.guest_id
GROUP BY u.id
ORDER BY booking_count DESC
LIMIT 1;