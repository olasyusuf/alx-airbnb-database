-- Write a query to find all properties where the 
-- average rating is greater than 4.0 using a subquery.

SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    (SELECT AVG(r.rating) FROM review AS r WHERE r.property_id = p.property_id) AS average_rating
FROM
    property AS p
WHERE
    (SELECT AVG(r.rating) FROM review AS r WHERE r.property_id = p.property_id) > 4.0;


-- Write a correlated subquery to find users who have made more than 3 bookings.  

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    user AS u
WHERE
    (SELECT COUNT(*)
     FROM booking AS b
     WHERE b.user_id = u.user_id) > 3;
