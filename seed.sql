INSERT INTO users (full_name, email, phone_number, account_type) VALUES
('John Doe', 'john@example.com', '1234567890', 'guest'),
('Jane Smith', 'jane@example.com', '0987654321', 'host'),
('Michael Chen', 'michael@example.com', '1112223333', 'host'),
('Sarah Johnson', 'sarah@example.com', '4445556666', 'guest'),
('David Wilson', 'david@example.com', '7778889999', 'host'),
('Emma Brown', 'emma@example.com', '3334445555', 'guest'),
('Alex Rodriguez', 'alex@example.com', '6667778888', 'host'),
('Lisa Taylor', 'lisa@example.com', '9990001111', 'guest'),
('Tom Harris', 'tom@example.com', '1231231234', 'host');

INSERT INTO listings (title, description, price_per_night, location_city, location_country, bedrooms, bathrooms, host_id) VALUES
('Cozy Apartment', 'A comfortable apartment in the heart of the city', 100.00, 'New York', 'USA', 2, 1, 2),
('Luxury Villa', 'A spacious villa with a beautiful garden', 200.00, 'Paris', 'France', 4, 2, 2),
('Mountain Retreat', 'Peaceful cabin with stunning mountain views', 150.00, 'Denver', 'USA', 3, 2, 3),
('Beachfront Condo', 'Modern condo steps from the beach', 180.00, 'Miami', 'USA', 2, 2, 7),
('Historic Townhouse', 'Charming townhouse in old city center', 160.00, 'London', 'UK', 3, 1, 3),
('Modern Loft', 'Industrial style loft in arts district', 120.00, 'Berlin', 'Germany', 1, 1, 7),
('Seaside Villa', 'Luxurious villa with private pool', 300.00, 'Barcelona', 'Spain', 5, 4, 7),
('City Studio', 'Compact studio in downtown', 90.00, 'New York', 'USA', 1, 1, 5),
('Mountain Cabin', 'Rustic cabin in the woods', 140.00, 'Denver', 'USA', 2, 1, 9);

INSERT INTO bookings (guest_id, listing_id, start_date, end_date, total_price, booking_status) VALUES
(1, 1, '2023-01-01', '2023-01-07', 700.00, 'confirmed'),
(4, 1, '2023-02-01', '2023-02-07', 700.00, 'confirmed'),
(1, 2, '2023-01-08', '2023-01-15', 1400.00, 'confirmed'),
(4, 3, '2023-02-01', '2023-02-05', 750.00, 'confirmed'),
(6, 4, '2023-02-10', '2023-02-15', 900.00, 'confirmed'),
(4, 5, '2023-03-01', '2023-03-03', 480.00, 'canceled'),
(6, 6, '2023-03-15', '2023-03-20', 600.00, 'confirmed'),
(1, 7, '2023-04-01', '2023-04-07', 2100.00, 'confirmed'),
(8, 1, '2023-05-01', '2023-05-07', 700.00, 'confirmed'),
(1, 4, '2023-05-10', '2023-05-15', 900.00, 'confirmed');

INSERT INTO reviews (guest_id, listing_id, rating, review_text) VALUES
(1, 1, 4, 'A great stay!'),
(4, 1, 5, 'Wonderful experience!'),
(1, 2, 5, 'The best stay ever!'),
(4, 3, 5, 'Incredible mountain views and very cozy!'),
(6, 4, 4, 'Great location, beautiful beach access'),
(6, 6, 5, 'Loved the industrial design and location'),
(1, 7, 4, 'Amazing villa, slightly expensive but worth it'),
(8, 1, 3, 'Good location but noisy');

INSERT INTO payments (booking_id, amount_paid, payment_method, payment_status) VALUES
(1, 700.00, 'Credit Card', 'paid'),
(2, 700.00, 'Credit Card', 'paid'),
(3, 1400.00, 'PayPal', 'paid'),
(4, 750.00, 'Credit Card', 'paid'),
(5, 900.00, 'PayPal', 'paid'),
(6, 480.00, 'Credit Card', 'refunded'),
(7, 600.00, 'Bank Transfer', 'paid'),
(8, 2100.00, 'Credit Card', 'paid'),
(9, 700.00, 'PayPal', 'paid'),
(10, 900.00, 'Credit Card', 'paid');
