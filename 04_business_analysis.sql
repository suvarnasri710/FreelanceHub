USE freelancer;

-- What percentage of projects have been completed?

SELECT
    COUNT(CASE WHEN status = 'Completed' THEN 1 END) * 100.0
    / COUNT(*) AS completion_rate
FROM project_details;


-- What is the current project distribution?

SELECT
    status,
    COUNT(*) AS total_projects
FROM project_details
GROUP BY status
ORDER BY total_projects DESC;


-- What is the average value of projects in each status?

SELECT
    status,
    ROUND(AVG(budget), 2) AS average_budget
FROM project_details
GROUP BY status;


-- Which projects have the highest budgets?

SELECT
    project_name,
    budget,
    status
FROM project_details
ORDER BY budget DESC
LIMIT 5;


-- Which freelancers are handling the highest-value projects?

SELECT
    f.freelancer_name,
    COUNT(p.project_id) AS total_projects,
    SUM(p.budget) AS total_project_value
FROM freelancer_details f
JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY total_project_value DESC;


-- Which freelancers are handling the most projects?

SELECT
    f.freelancer_name,
    COUNT(p.project_id) AS total_projects
FROM freelancer_details f
JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY total_projects DESC;


-- Which freelancers receive the best ratings?

SELECT
    f.freelancer_name,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(r.review_id) AS total_reviews
FROM freelancer_details f
JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
JOIN reviews r
    ON p.project_id = r.project_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY average_rating DESC;


-- Which clients have the highest total project value?

SELECT
    c.client_name,
    COUNT(p.project_id) AS total_projects,
    SUM(p.budget) AS total_project_value
FROM client_details c
JOIN project_details p
    ON c.client_id = p.client_id
GROUP BY
    c.client_id,
    c.client_name
ORDER BY total_project_value DESC;


-- Which clients have worked on more than one project?

SELECT
    c.client_name,
    COUNT(p.project_id) AS total_projects
FROM client_details c
JOIN project_details p
    ON c.client_id = p.client_id
GROUP BY
    c.client_id,
    c.client_name
HAVING COUNT(p.project_id) > 1
ORDER BY total_projects DESC;


-- Which projects still have unpaid amounts?

SELECT
    p.project_name,
    c.client_name,
    pay.amount,
    pay.payment_status
FROM payments pay
JOIN project_details p
    ON pay.project_id = p.project_id
JOIN client_details c
    ON p.client_id = c.client_id
WHERE pay.payment_status = 'Pending';


-- How much money has been received and how much is still pending?

SELECT
    payment_status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;


-- Which projects have deadlines coming soon?

SELECT
    project_name,
    deadline,
    status,
    DATEDIFF(deadline, CURDATE()) AS days_remaining
FROM project_details
WHERE deadline >= CURDATE()
ORDER BY deadline;


-- Which projects have passed their deadline but are not completed?

SELECT
    project_id,
    project_name,
    deadline,
    status
FROM project_details
WHERE deadline < CURDATE()
  AND status <> 'Completed';


-- How are freelancers performing across projects and ratings?

SELECT
    f.freelancer_name,
    COUNT(DISTINCT p.project_id) AS total_projects,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COALESCE(SUM(p.budget), 0) AS project_value
FROM freelancer_details f
LEFT JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
LEFT JOIN reviews r
    ON p.project_id = r.project_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY project_value DESC;


-- Which clients are most active on the platform?

SELECT
    c.client_name,
    COUNT(p.project_id) AS projects_created,
    COALESCE(SUM(p.budget), 0) AS total_project_value,
    ROUND(AVG(p.budget), 2) AS average_project_value
FROM client_details c
LEFT JOIN project_details p
    ON c.client_id = p.client_id
GROUP BY
    c.client_id,
    c.client_name
ORDER BY projects_created DESC;
