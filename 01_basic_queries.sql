USE freelancer;

-- 1. Display all clients
SELECT *
FROM client_details;

-- 2. Display all freelancers
SELECT *
FROM freelancer_details;

-- 3. Display only freelancer names and skills
SELECT freelancer_name, skills
FROM freelancer_details;

-- 4. Find freelancers with more than 5 years of experience
SELECT *
FROM freelancer_details
WHERE experience > 5;

-- 5. Find freelancers charging more than 1000 per hour
SELECT *
FROM freelancer_details
WHERE hourly_rate > 1000;

-- 6. Display freelancers from highest to lowest hourly rate
SELECT *
FROM freelancer_details
ORDER BY hourly_rate DESC;

-- 7. Display freelancers from lowest to highest hourly rate
SELECT *
FROM freelancer_details
ORDER BY hourly_rate ASC;

-- 8. Find the highest hourly rate
SELECT MAX(hourly_rate) AS highest_hourly_rate
FROM freelancer_details;

-- 9. Find the lowest hourly rate
SELECT MIN(hourly_rate) AS lowest_hourly_rate
FROM freelancer_details;

-- 10. Find the average hourly rate
SELECT AVG(hourly_rate) AS average_hourly_rate
FROM freelancer_details;

-- 11. Count the number of freelancers
SELECT COUNT(*) AS total_freelancers
FROM freelancer_details;

-- 12. Find the total number of clients
SELECT COUNT(*) AS total_clients
FROM client_details;
