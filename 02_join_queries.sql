USE freelancer;
 -- Which freelancer is working for which client?
SELECT
    p.project_id,
    p.project_name,
    c.client_name,
    c.company,
    f.freelancer_name,
    p.budget,
    p.status
FROM project_details p
JOIN client_details c
    ON p.client_id = c.client_id
JOIN freelancer_details f
    ON p.freelancer_id = f.freelancer_id;

-- What projects has each client created?
SELECT
    c.client_name,
    c.company,
    p.project_name,
    p.budget,
    p.status
FROM client_details c
JOIN project_details p
    ON c.client_id = p.client_id
ORDER BY c.client_name;

-- Which projects are assigned to each freelancer?
SELECT
    f.freelancer_name,
    f.skills,
    p.project_name,
    p.budget,
    p.status
FROM freelancer_details f
JOIN project_details p
    ON f.freelancer_id = p.freelancer_id
ORDER BY f.freelancer_name;

-- What tasks belong to each project?
SELECT
    p.project_name,
    t.task_id,
    t.task_name,
    t.assigned_date,
    t.due_date,
    t.task_status
FROM project_details p
JOIN project_tasks t
    ON p.project_id = t.project_id
ORDER BY p.project_name;

-- How much has each client paid for their projects?
SELECT
    c.client_name,
    p.project_name,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    pay.payment_status
FROM client_details c
JOIN project_details p
    ON c.client_id = p.client_id
JOIN payments pay
    ON p.project_id = pay.project_id
ORDER BY c.client_name;

--What rating did each client give to the freelancer?
SELECT
    p.project_name,
    c.client_name,
    f.freelancer_name,
    r.rating,
    r.feedback,
    r.review_date
FROM reviews r
JOIN project_details p
    ON r.project_id = p.project_id
JOIN client_details c
    ON p.client_id = c.client_id
JOIN freelancer_details f
    ON p.freelancer_id = f.freelancer_id;

-- Who is currently working on active projects?
SELECT
    p.project_name,
    f.freelancer_name,
    f.skills,
    p.start_date,
    p.deadline,
    p.status
FROM project_details p
JOIN freelancer_details f
    ON p.freelancer_id = f.freelancer_id
WHERE p.status = 'In Progress';

--Which freelancers are handling high-value projects?
SELECT
    p.project_name,
    f.freelancer_name,
    p.budget,
    p.status
FROM project_details p
JOIN freelancer_details f
    ON p.freelancer_id = f.freelancer_id
WHERE p.budget > 7000
ORDER BY p.budget DESC;
