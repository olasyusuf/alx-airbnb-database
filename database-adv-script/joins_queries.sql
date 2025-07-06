-- Write a query using an INNER JOIN to retrieve all bookings 
-- and the respective users who made those bookings.

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email
FROM
    booking AS b
INNER JOIN
    user AS u ON b.user_id = u.user_id;


-- Write a query using a LEFT JOIN to retrieve all properties 
-- and their reviews, including properties that have no reviews. 

SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM
    property AS p
LEFT JOIN
    review AS r ON p.property_id = r.property_id
ORDER BY
    b.created_at DESC;


-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, 
-- even if the user has no booking or a booking is not linked to a user.

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM
    user AS u
FULL OUTER JOIN
    booking AS b ON u.user_id = b.user_id;

-- For MySQL

SELECT u.user_id, u.first_name, u.last_name, u.email, b.booking_id, b.start_date, b.end_date, b.total_price, b.status
FROM
    user AS u
LEFT JOIN
    booking AS b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.first_name, u.last_name, u.email, b.booking_id, b.start_date, b.end_date, b.total_price, b.status
FROM
    user AS u
RIGHT JOIN
    booking AS b ON u.user_id = b.user_id;
