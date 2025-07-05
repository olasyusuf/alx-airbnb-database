-- Write a query to find the total number of bookings made by each user, 
-- using the COUNT function and GROUP BY clause.

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM
    user AS u
INNER JOIN
    booking AS b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY
    total_bookings DESC;



-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- to rank properties based on the total number of bookings they have received.

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM
    user AS u
INNER JOIN
    booking AS b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY
    total_bookings DESC;