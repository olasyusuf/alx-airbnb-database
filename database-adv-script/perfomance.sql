--
-- Initial Query: Retrieve all bookings along with user, property, and payment details
--

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM
    booking AS b
INNER JOIN
    user AS u ON b.user_id = u.user_id
INNER JOIN
    property AS p ON b.property_id = p.property_id
INNER JOIN
    payment AS pay ON b.booking_id = pay.booking_id
ORDER BY
    b.created_at DESC;


-- Refactored Query: Optimized for common use cases (e.g., getting recent bookings with key details)
-- This version assumes the indexes created earlier are in place.
EXPLAIN SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM
    booking AS b
INNER JOIN
    user AS u ON b.user_id = u.user_id
INNER JOIN
    property AS p ON b.property_id = p.property_id
LEFT JOIN -- Changed to LEFT JOIN if payment might not always exist immediately after booking
    payment AS pay ON b.booking_id = pay.booking_id
ORDER BY
    b.created_at DESC
LIMIT 100; -- Added LIMIT for common use case of fetching recent bookings