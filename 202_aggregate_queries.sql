USE freelancer;

-- 1. Total number of projects
SELECT COUNT(*) AS total_projects
FROM project_details;
+----------------+
| total_projects |
+----------------+
|             10 |
+----------------+

-- 2. Total project budget
SELECT SUM(budget) AS total_project_budget
FROM project_details;
+----------------------+
| total_project_budget |
+----------------------+
|             78500.00 |
+----------------------+

-- 3. Average project budget
SELECT AVG(budget) AS average_project_budget
FROM project_details;
+------------------------+
| average_project_budget |
+------------------------+
|            7850.000000 |
+------------------------+

-- 4. Highest project budget
SELECT MAX(budget) AS highest_project_budget
FROM project_details;
+------------------------+
| highest_project_budget |
+------------------------+
|               15000.00 |
+------------------------+

-- 5. Lowest project budget
SELECT MIN(budget) AS lowest_project_budget
FROM project_details;
+-----------------------+
| lowest_project_budget |
+-----------------------+
|               3500.00 |
+-----------------------+

-- 6. Number of projects by status
SELECT status, COUNT(*) AS project_count
FROM project_details 
GROUP BY status;
+-------------+---------------+
| status      | project_count |
+-------------+---------------+
| In Progress |             4 |
| Completed   |             3 |
| Pending     |             3 |
+-------------+---------------+

-- 7. Total budget by project status
SELECT status, SUM(budget) AS total_budget
FROM project_details
GROUP BY status;
+-------------+--------------+
| status      | total_budget |
+-------------+--------------+
| In Progress |     39000.00 |
| Completed   |     14000.00 |
| Pending     |     25500.00 |
+-------------+--------------+

-- 8. Number of projects handled by each freelancer
SELECT f.freelancer_name, COUNT(p.project_id) AS total_projects
FROM freelancer_details f
LEFT JOIN project_details p
ON f.freelancer_id = p.freelancer_id
GROUP BY f.freelancer_id, f.freelancer_name
ORDER BY total_projects DESC;
+-----------------+----------------+
| freelancer_name | total_projects |
+-----------------+----------------+
| Rahul Sharma    |              1 |
| Priya Reddy     |              1 |
| Arjun Kumar     |              1 |
| Sneha Patel     |              1 |
| Karan Mehta     |              1 |
| Neha Verma      |              1 |
| Vivek Singh     |              1 |
| Ananya Das      |              1 |
| Rohit Nair      |              1 |
| Divya Joshi     |              1 |
+-----------------+----------------+

-- 9. Total project value handled by each freelancer
SELECT f.freelancer_name, COUNT(p.project_id) AS total_projects,
COALESCE(SUM(p.budget), 0) AS total_project_value
FROM freelancer_details f
LEFT JOIN project_details p
 ON f.freelancer_id = p.freelancer_id
GROUP BY f.freelancer_id, f.freelancer_name
ORDER BY total_project_value DESC;
+-----------------+----------------+---------------------+
| freelancer_name | total_projects | total_project_value |
+-----------------+----------------+---------------------+
| Ananya Das      |              1 |            15000.00 |
| Rahul Sharma    |              1 |            12000.00 |
| Vivek Singh     |              1 |            11000.00 |
| Priya Reddy     |              1 |             9000.00 |
| Karan Mehta     |              1 |             7000.00 |
| Rohit Nair      |              1 |             6500.00 |
| Divya Joshi     |              1 |             5500.00 |
| Arjun Kumar     |              1 |             5000.00 |
| Neha Verma      |              1 |             4000.00 |
| Sneha Patel     |              1 |             3500.00 |
+-----------------+----------------+---------------------+

-- 10. Number of projects for each client
SELECT
    c.client_name,
    COUNT(p.project_id) AS total_projects
FROM client_details c
LEFT JOIN project_details p
    ON c.client_id = p.client_id
GROUP BY
    c.client_id,
    c.client_name
ORDER BY total_projects DESC;
+----------------+----------------+
| client_name    | total_projects |
+----------------+----------------+
| John Smith     |              1 |
| Emily Johnson  |              1 |
| David Lee      |              1 |
| Sarah Williams |              1 |
| Michael Brown  |              1 |
| Priya Sharma   |              1 |
| Ahmed Hassan   |              1 |
| Sophia Garcia  |              1 |
| Daniel Kim     |              1 |
| Olivia Wilson  |              1 |
+----------------+----------------+

-- 11. Total spending by each client
SELECT
    c.client_name,
    COALESCE(SUM(p.budget), 0) AS total_spending
FROM client_details c
LEFT JOIN project_details p
    ON c.client_id = p.client_id
GROUP BY
    c.client_id,
    c.client_name
ORDER BY total_spending DESC;
+----------------+----------------+
| client_name    | total_spending |
+----------------+----------------+
| Sophia Garcia  |       15000.00 |
| Emily Johnson  |       12000.00 |
| Ahmed Hassan   |       11000.00 |
| Sarah Williams |        9000.00 |
| Michael Brown  |        7000.00 |
| Daniel Kim     |        6500.00 |
| Olivia Wilson  |        5500.00 |
| John Smith     |        5000.00 |
| Priya Sharma   |        4000.00 |
| David Lee      |        3500.00 |
+----------------+----------------+

-- 12. Average freelancer hourly rate
SELECT AVG(hourly_rate) AS average_hourly_rate
FROM freelancer_details;
+---------------------+
| average_hourly_rate |
+---------------------+
|            995.0000 |
+---------------------+

-- 13. Number of reviews by rating
SELECT rating,
COUNT(*) AS review_count
FROM reviews
GROUP BY rating
ORDER BY rating DESC;
+--------+--------------+
| rating | review_count |
+--------+--------------+
|      5 |            3 |
|      4 |            2 |
+--------+--------------+

-- 14. Total payments received
SELECT SUM(amount) AS total_paid_amount
FROM payments WHERE payment_status = 'Paid';
+-------------------+
| total_paid_amount |
+-------------------+
|          31500.00 |
+-------------------+

-- 15. Total pending payments
SELECT
    SUM(amount) AS total_pending_amount
FROM payments
WHERE payment_status = 'Pending';
+----------------------+
| total_pending_amount |
+----------------------+
|              9500.00 |
+----------------------+
