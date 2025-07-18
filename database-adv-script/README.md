<div align="center">
  <br>
  <h1><b>alx-airbnb-database</b></h1>
  <h2><i>advanced-script</i></h2>
</div>
<br />

---
## Table of Contents

- [Table of Contents](#table-of-contents)
  - [Objectives](#objectives)
  - [Complex Queries with Joins](#complex-queries-with-joins)
  - [Subqueries](#subqueries)
  - [Aggregations and Window Functions](#aggregations-and-window-functions)


<br />

---

### Objectives

This document details the implementation of advanced SQL querying and optimization techniques for a simulated Airbnb database, ensuring you are equipped to handle large-scale applications where efficiency and scalability are critical.


<br />

---

### Complex Queries with Joins

- Query using an **`INNER JOIN`** to retrieve all bookings and the respective users who made those bookings.

![inner join](./complex_queries_with_joins/inner_join.png)

<br />

- Query using a **`LEFT JOIN`** to retrieve all properties and their reviews, including properties that have no reviews.

![left join](./complex_queries_with_joins/left_join.png)


<br />

- Query using a **`FULL OUTER JOIN`** to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
  
  - **Note**: While MySQL does not natively support **`FULL OUTER JOIN`**,this functionality can be achieved by using **`UNION`** to combine separate **`LEFT JOIN`** and **`RIGHT JOIN`** queries.

![full join](./complex_queries_with_joins/full_outer_join.png)

<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

---

### Subqueries

- Query to find all properties where the average rating is greater than 4.0 using a subquery.

![non_correlated](./subqueries/non_correlated.png)

<br />

- A correlated subquery to find users who have made more than 3 bookings.

![correlated](./subqueries/correlated.png)


<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

---

### Aggregations and Window Functions

- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

![aggregate function](./aggregations_n_window_functions/aggregate.png)

<br />

- A query using window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

![window function](./aggregations_n_window_functions/window_rank.png)

<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

