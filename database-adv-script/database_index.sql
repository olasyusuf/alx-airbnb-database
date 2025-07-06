-- All tables primary key columns already have clustered index automaticaly created by primary key
-- Indexes for table `property` on location column for full text search optimization - This is already in the DDL 
--
ALTER TABLE `property` ADD FULLTEXT KEY `location` (`location`);

--
--
-- Indexes for the 'user' table

-- Index on 'role' for efficient filtering of users by their role
CREATE INDEX idx_user_role ON user (role);

-- Index on 'email' for efficient filtering of users by their email
CREATE INDEX idx_user_email ON user (email);

-- Index on 'password_hash' for efficient filtering of users by their email
CREATE INDEX idx_password_hash ON user (password_hash);


--
--
-- Indexes for the 'booking' table

-- Index on 'property_id' to optimize joins with the 'property' table
CREATE INDEX idx_booking_property_id ON booking (property_id);

-- Index on 'user_id' to optimize joins with the 'user' table
CREATE INDEX idx_booking_user_id ON booking (user_id);

-- Index on 'start_date' and 'end_date' for efficient date range queries (e.g., availability checks)
CREATE INDEX idx_booking_start_date ON booking (start_date);

-- Index on 'start_date' and 'end_date' for efficient date range queries (e.g., availability checks)
CREATE INDEX idx_booking_dates ON booking (start_date, end_date);

-- Index on 'status' for filtering bookings by their status
CREATE INDEX idx_booking_status ON booking (status);

-- Index on 'user, property, status' for filtering bookings by their status
CREATE INDEX idx_user_property_status (user_id, property_id, status)

--
--
-- Indexes for the 'property' table

-- Index on 'host_id' to optimize joins with the 'user' table (for host properties)
CREATE INDEX idx_property_host_id ON property (host_id);

-- Index on 'price_per_night' for efficient filtering and ordering by price
CREATE INDEX idx_property_price_per_night ON property (price_per_night);

-- Index on 'name' for faster lookups or filtering by property name
CREATE INDEX idx_property_name ON property (name);

--
--
-- Indexes for the 'property_feature' table

-- Index on 'amenity' for faster lookups or filtering by property feature
CREATE INDEX idx_property_amenity ON property_feature (amenity);
CREATE INDEX idx_property_id ON property_feature (property_id);


--- Query 1
--- Find users with a specific email
EXPLAIN ANALYZE SELECT user_id, first_name,last_name, email
FROM user
WHERE email = 'akpan_dan@gmail.com';


--- Query 2
--- Find properties in a specific location within a price range
EXPLAIN ANALYZE SELECT property_id, name, location, price_per_night
FROM property
WHERE location = 'block 2A, Dimple Close, Ikoyi - Lagos' AND price_per_night <= 500
ORDER BY price_per_night DESC;


--- Query 3
--- Find all confirmed bookings for a specific user
EXPLAIN ANALYZE SELECT b.booking_id, p.name AS property_name, b.start_date, b.end_date, b.status
FROM booking AS b
INNER JOIN property AS p ON b.property_id = p.property_id
WHERE b.user_id = '441de6b3-54cf-11f0-b651-0a0027000014' AND b.status = 'Confirmed'
ORDER BY b.start_date ASC;