# Designing an Airbnb Database

## Objective:

The goal of this assignment is to help students practice fundamental **MySQL queries**, including **CRUD operations, filtering, ordering, grouping, aggregate functions, joins, and subqueries** while designing a simplified **Airbnb database schema**.

## Requirements

### 1. Database Schema Design

Students must create a database named airbnb_db with the following tables:

#### Users Table

- Stores details of guests and hosts.
- Should include user **ID**, full name, email, phone number, account type (host/guest), and signup date.

#### Listings Table

- Stores details of properties listed by hosts.
- Should include listing **ID**, title, description, price per night, location (city, country), number of bedrooms, number of bathrooms, and host **ID** (foreign key referencing Users table).

#### Bookings Table

- Tracks bookings made by guests.
- Should include booking **ID**, guest **ID**, listing **ID**, start date, end date, total price, and booking status (confirmed/canceled).

#### Reviews Table

- Stores user reviews for properties.
- Should include review **ID**, guest **ID**, listing **ID**, rating (1-5), review text, and review date.

#### Payments Table

- Stores payment details for bookings.
- Should include payment **ID**, booking **ID**, amount paid, payment method, and payment status.

### 2. Queries to Implement

#### Basic CRUD Operations

- Insert sample data into all tables.
- Retrieve data using SELECT statements.
- Update existing records.
- Delete specific records.

#### Filtering and Sorting

- Retrieve all listings available in a particular city.
- List all properties sorted by price (ascending and descending).
- Get bookings for a particular user.
- Find properties within a specific price range.

#### Aggregations and Grouping

- Count total listings per city.
- Find the average rating of each listing.
- Get the total revenue earned by each host.
- Show the number of bookings per month.

#### Joins and Subqueries

- Retrieve all bookings along with guest and listing details.
- Show listings with their average rating (using JOIN).
- Find hosts who have never received a booking.
- Get the most booked property in the database.

#### Advanced Queries

- Retrieve all guests who have spent more than **$1000** in total bookings.
- Find listings that have never been reviewed.
- Get the top 3 highest-rated properties.
- List the most active guests (users who made the most bookings).
