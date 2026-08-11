USE freelancer;

-- 1. Total number of projects
SELECT COUNT(*) AS total_projects
FROM project_details;


-- 2. Total project budget
SELECT SUM(budget) AS total_project_budget
FROM project_details;


-- 3. Average project budget
SELECT AVG(budget) AS average_project_budget
FROM project_details;


-- 4. Highest project budget
SELECT MAX(budget) AS highest_project_budget
FROM project_details;


-- 5. Lowest project budget
SELECT MIN(budget) AS lowest_project_budget
FROM project_details;


-- 6. Number of projects by status
SELECT
    status,
    COUNT(*) AS project_count
FROM project_details
GROUP BY status;


-- 7. Total budget by project status
SELECT
    status,
    SUM(budget) AS total_budget
FROM project_details
GROUP BY status;


-- 8. Number of projects handled by each freelancer
SELECT
    f.freelancer_name,
    COUNT(p.project_id) AS total_projects
FROM freelancer_details f
LEFT JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY total_projects DESC;


-- 9. Total project value handled by each freelancer
SELECT
    f.freelancer_name,
    COUNT(p.project_id) AS total_projects,
    COALESCE(SUM(p.budget), 0) AS total_project_value
FROM freelancer_details f
LEFT JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
GROUP BY
    f.freelancer_id,
    f.freelancer_name
ORDER BY total_project_value DESC;


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


-- 12. Average freelancer hourly rate
SELECT
    AVG(hourly_rate) AS average_hourly_rate
FROM freelancer_details;


-- 13. Average rating
SELECT
    AVG(rating) AS average_rating
FROM reviews;


-- 14. Number of reviews by rating
SELECT
    rating,
    COUNT(*) AS review_count
FROM reviews
GROUP BY rating
ORDER BY rating DESC;


-- 15. Total payments received
SELECT
    SUM(amount) AS total_paid_amount
FROM payments
WHERE payment_status = 'Paid';


-- 16. Total pending payments
SELECT
    SUM(amount) AS total_pending_amount
FROM payments
WHERE payment_status = 'Pending';
