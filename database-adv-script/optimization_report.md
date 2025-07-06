<div align="center">
  <br>
  <h1><b>alx-airbnb-database</b></h1>
  <h2><i>Optimize Complex Queries</i></h2>
</div>
<br />

---
## Table of Contents

- [Table of Contents](#table-of-contents)
  - [Objectives](#objectives)
  - [Optimize Complex Queries](#optimize-complex-queries)


<br />

---

### Objectives

This document details the refactoring of complex queries for performance improvement.


<br />

---

### Optimize Complex Queries

-  initial query that retrieves all bookings along with the user details, property details, and payment details 

![inner join](./query_omtimization/initial_query.png)

<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>


- Analyze the query’s performance using EXPLAIN to identify any inefficiencies.

`using EXPLAIN`
![inner join](./query_omtimization/explain.png)


`using EXPLAIN ANALYZE`
![inner join](./query_omtimization/explain_analyze.png)
<br />

<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

- After refactoring the query to reduce execution time, such as by reducing unnecessary joins or using.
  

`using EXPLAIN`
![inner join](./query_omtimization/optimized_explain.png)


`using EXPLAIN ANALYZE`
![inner join](./query_omtimization/optimized_explain_analyze.png)
<br />
<div align="right">

  [ [↑ to top ↑](#table-of-contents) ]
</div>

