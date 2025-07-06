-- SQL Commands to Implement Partitioning on the Booking table by start_date (Yearly, sub-partitioned Monthly)
-- This example uses MySQL syntax for partitioning

-- Create a partitioned version of the booking table

CREATE TABLE booking_partitioned (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36),
    user_id CHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('PENDING', 'CONFIRMED', 'CANCELED') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Composite primary key must include the partitioning column
    PRIMARY KEY (booking_id, start_date),

    -- Supporting indexes for performance
    INDEX idx_property_id (property_id),
    INDEX idx_user_property_status (user_id, property_id, status)
) ENGINE=InnoDB
PARTITION BY RANGE (YEAR(start_date)) 
SUBPARTITION BY HASH( MONTH(start_date) ) SUBPARTITIONS 12 
(
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027),
    PARTITION p2027 VALUES LESS THAN (2028),
    PARTITION p2028 VALUES LESS THAN (2029),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Populate data from original bookings table

INSERT INTO booking_partitioned (
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
)
SELECT 
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM booking;

COMMIT;


-- Test Query 1: Fetch bookings for a specific year (e.g., 2025)
-- This query should ideally only scan the 'p2025' partition.
EXPLAIN SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    booking_partitioned
WHERE
    start_date >= '2025-01-01' AND start_date < '2026-01-01';

-- Test Query 2: Fetch bookings for a specific month within a year (e.g., August 2025)
-- This query should also benefit from partition pruning to the 'p2025' partition,
-- and then further filter within that partition.
EXPLAIN SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    booking_partitioned
WHERE
    start_date >= '2025-08-01' AND start_date < '2025-09-01';

-- Test Query 3: Fetch bookings spanning multiple years (e.g., late 2025 to early 2026)
-- This query should scan multiple relevant partitions (e.g., 'p2025' and 'p2026').
EXPLAIN SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    booking_partitioned
WHERE
    start_date >= '2025-10-01' AND start_date < '2026-03-01';

