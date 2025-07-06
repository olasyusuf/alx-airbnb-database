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


--
--
-- Indexes for the 'booking' table

-- Index on 'property_id' to optimize joins with the 'property' table
CREATE INDEX idx_booking_property_id ON booking (property_id);

-- Index on 'user_id' to optimize joins with the 'user' table
CREATE INDEX idx_booking_user_id ON booking (user_id);

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




