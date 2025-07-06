<div align="center">
  <br>
  <h1><b>alx-airbnb-database</b></h1>
  <h2><i>Monitor and Refine Database Performance</i></h2>
</div>
<br />

---
## Table of Contents

- [Table of Contents](#table-of-contents)
  - [Objectives](#objectives)
  - [Identifying Initial Bottlenecks Through Monitoring](#identifying-initial-bottlenecks-through-monitoring)
  - [After Indexes:](#after-indexes)


<br />

---

### Objectives

This document details continuously monitoring and refining database performance by analyzing query execution plans and making schema adjustments.


<br />

---

### Identifying Initial Bottlenecks Through Monitoring

An assessment revealed numerous frequently executed queries, notably those involving the bookings and users tables. EXPLAIN was then utilized to analyze MySQL's processing of these queries. Consider the following example:

- `query`

```sql
--- Find users with a specific email or phone_number or last_name
EXPLAIN ANALYZE SELECT user_id, first_name, last_name, email
FROM user
WHERE email = 'akpan_dan@gmail.com' OR last_name = 'Akpan' OR phone_number = '2347098128978';
```

<br />

Despite indexes being present on columns such as the primary key user_id and email, the EXPLAIN ANALYZE output indicated a full scan of the user table. This occurred because last_name and phone_number lacked supporting indexes.

<br />

**Creating appropriate indexes for the `user`table** 

For optimized query performance, the following indexes were further created on `user` table:

```sql
--
-- Indexes for the 'user' table

-- Index on 'last_name' for efficient filtering of users by their last_name
CREATE INDEX idx_last_name ON user (last_name);

-- Index on 'phone_number' for efficient filtering of users by their phone_number
CREATE INDEX idx_phone_number ON user (phone_number);

```

<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

---


### After Indexes: 
**Observations**

After recreating the indexes and rerunning the tests, a noticeable improvement in query performance was observed. Queries that previously relied on full table scans were now efficiently resolved using index lookups. 

This strategic shift significantly reduced the number of rows examined during execution and, consequently, lowered the overall query cost, leading to much faster data retrieval.

<br />

- `query`

The query benefited from `idx_last_name` and `phone_number`.

<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>



