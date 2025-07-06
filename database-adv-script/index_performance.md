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
  - [Implement Indexes for Optimization](#implement-indexes-for-optimization)
    - [Indexing](#indexing)
  - [Aggregations and Window Functions](#aggregations-and-window-functions)


<br />

---

### Objectives

This document details the implementation of advanced SQL querying and optimization techniques for a simulated Airbnb database, ensuring you are equipped to handle large-scale applications where efficiency and scalability are critical.


<br />

---

### Implement Indexes for Optimization

#### Indexing

- **`Primary Keys`**: Indexed automatically.
- **`Additional Indexes`**:
    - **`email`** in the `User` table.
    - `FullText index` on **`location`** in the `Property` table.
    - **`amenity`** in the `Property_Feature` table.
    - **`property_id`** in the `Property_Feature`, and `Booking` tables.
    - **`booking_id`** in the `Booking` and `Payment` tables.


<br />





---

### Aggregations and Window Functions

- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

![inner join](./aggregations_n_window_functions/aggregate.png)

<br />

- A query using window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

![inner join](./aggregations_n_window_functions/window_rank.png)


<br />


