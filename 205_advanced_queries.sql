-- How can we classify projects based on their budget?
SELECT
    project_name,
    budget,
    CASE
        WHEN budget >= 10000 THEN 'High Value'
        WHEN budget >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS project_category
FROM project_details;

--How many freelancers are junior, mid-level, or senior?
SELECT
    freelancer_name,
    experience,
    CASE
        WHEN experience >= 6 THEN 'Senior'
        WHEN experience >= 3 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS experience_level
FROM freelancer_details;

--Which freelancers charge more than the average hourly rate?
SELECT
    freelancer_name,
    hourly_rate
FROM freelancer_details
WHERE hourly_rate > (
    SELECT AVG(hourly_rate)
    FROM freelancer_details
)
ORDER BY hourly_rate DESC;

--Which projects are more expensive than the typical project?
SELECT
    project_name,
    budget
FROM project_details
WHERE budget > (
    SELECT AVG(budget)
    FROM project_details
)
ORDER BY budget DESC;

--5. CTE — Freelancer project summary
--CTE = Common Table Expression.
WITH freelancer_summary AS (
    SELECT
        f.freelancer_id,
        f.freelancer_name,
        COUNT(p.project_id) AS total_projects,
        COALESCE(SUM(p.budget), 0) AS total_project_value
    FROM freelancer_details f
    LEFT JOIN project_details p
        ON f.freelancer_id = p.freelancer_id
    GROUP BY
        f.freelancer_id,
        f.freelancer_name
)

SELECT *
FROM freelancer_summary
ORDER BY total_project_value DESC;

--Top-value clients
WITH client_summary AS (
    SELECT
        c.client_id,
        c.client_name,
        COUNT(p.project_id) AS total_projects,
        COALESCE(SUM(p.budget), 0) AS total_spending
    FROM client_details c
    LEFT JOIN project_details p
        ON c.client_id = p.client_id
    GROUP BY
        c.client_id,
        c.client_name
)

SELECT *
FROM client_summary
ORDER BY total_spending DESC;

--Rank freelancers by project value ⭐
WITH freelancer_summary AS (
    SELECT
        f.freelancer_id,
        f.freelancer_name,
        COALESCE(SUM(p.budget), 0) AS total_project_value
    FROM freelancer_details f
    LEFT JOIN project_details p
        ON f.freelancer_id = p.freelancer_id
    GROUP BY
        f.freelancer_id,
        f.freelancer_name
)

SELECT
    freelancer_name,
    total_project_value,
    RANK() OVER (
        ORDER BY total_project_value DESC
    ) AS freelancer_rank
FROM freelancer_summary;

--How far above or below the average is each project?
SELECT
    project_name,
    budget,
    ROUND(
        AVG(budget) OVER (),
        2
    ) AS average_project_budget,
    ROUND(
        budget - AVG(budget) OVER (),
        2
    ) AS difference_from_average
FROM project_details;

--Running total of payments
SELECT
    payment_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        ORDER BY payment_date, payment_id
    ) AS running_total
FROM payments
WHERE payment_status = 'Paid';

