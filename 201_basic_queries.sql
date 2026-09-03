USE freelancer;

-- 1. Display all clients
SELECT * FROM client_details;
+-----------+----------------+--------------------+------------------------------------+------------+-----------+
| client_id | client_Name    | company            | email_id                           | phone      | country   |
+-----------+----------------+--------------------+------------------------------------+------------+-----------+
|         1 | John Smith     | TechNova Solutions | john.smith_technova@gmail.com      | 1202550147 | USA       |
|         2 | Emily Johnson  | Bright Media       | emily_brightmedia@gmail.com        | 165550281  | Canada    |
|         3 | David Lee      | Lee Digital Agency | davidlee_lda@gmail.com             | 770090123  | UK        |
|         4 | Sarah Williams | Creative Minds     | sarah_creativeminds@gmail.com      | 1412555876 | Australia |
|         5 | Michael Brown  | Vision Tech        | michael_visiontech@gmail.com       | 4915156789 | Germany   |
|         6 | Priya Sharma   | NextGen Software   | priya_nextgen@gmail.com            | 9876543210 | India     |
|         7 | Ahmed Hassan   | Nile IT Solutions  | ahmed_nileit.eg@gmail.com          | 105557788  | Egypt     |
|         8 | Sophia Garcia  | Pixel Studio       | sophia_pixelstudio.es@gmail.com    | 4612555334 | Spain     |
|         9 | Daniel Kim     | SmartApps Korea    | daniel_smartapps.kr@gmail.com      | 105556677  | Korea     |
|        10 | Olivia Wilson  | CloudBridge Ltd    | olivia_cloudbridge.co.nz@gmail.com | 642155598  | USA       |
+-----------+----------------+--------------------+------------------------------------+------------+-----------+
  
-- 2. Display all freelancers
SELECT * FROM freelancer_details;
+---------------+-----------------+------------------------+--------------------------------------+------------+-------------+
| freelancer_id | freelancer_name | email_id               | skills                               | experience | hourly_rate |
+---------------+-----------------+------------------------+--------------------------------------+------------+-------------+
|             1 | Rahul Sharma    | rahul.sharma@gmail.com | Java, SQL, Spring Boot               |          5 |         900 |
|             2 | Priya Reddy     | priya.reddy@gmail.com  | Python, Django, PostgreSQL           |          4 |         850 |
|             3 | Arjun Kumar     | arjun.kumar@gmail.com  | HTML, CSS, JavaScript, React         |          3 |         700 |
|             4 | Sneha Patel     | sneha.patel@gmail.com  | UI/UX Design, Figma, Adobe XD        |          6 |        1200 |
|             5 | Karan Mehta     | karan.mehta@gmail.com  | SAP ABAP, SQL                        |          7 |        1500 |
|             6 | Neha Verma      | neha.verma@gmail.com   | Data Analysis, SQL, Power BI         |          4 |         950 |
|             7 | Vivek Singh     | vivek.singh@gmail.com  | Java, Android, Firebase              |          5 |        1000 |
|             8 | Ananya Das      | ananya.das@gmail.com   | Machine Learning, Python, TensorFlow |          2 |        1100 |
|             9 | Rohit Nair      | rohit.nair@gmail.com   | PHP, Laravel, MySQL                  |          6 |         950 |
|            10 | Divya Joshi     | divya.joshi@gmail.com  | Node.js, Express.js, MongoDB         |          3 |         800 |
+---------------+-----------------+------------------------+--------------------------------------+------------+-------------+
  
-- 3. Display only freelancer names and skills
SELECT freelancer_name, skills FROM freelancer_details;
+-----------------+--------------------------------------+
| freelancer_name | skills                               |
+-----------------+--------------------------------------+
| Rahul Sharma    | Java, SQL, Spring Boot               |
| Priya Reddy     | Python, Django, PostgreSQL           |
| Arjun Kumar     | HTML, CSS, JavaScript, React         |
| Sneha Patel     | UI/UX Design, Figma, Adobe XD        |
| Karan Mehta     | SAP ABAP, SQL                        |
| Neha Verma      | Data Analysis, SQL, Power BI         |
| Vivek Singh     | Java, Android, Firebase              |
| Ananya Das      | Machine Learning, Python, TensorFlow |
| Rohit Nair      | PHP, Laravel, MySQL                  |
| Divya Joshi     | Node.js, Express.js, MongoDB         |
+-----------------+--------------------------------------+
  
-- 4. Find freelancers with more than 5 years of experience
SELECT * FROM freelancer_details
WHERE experience > 5;
+---------------+-----------------+-----------------------+-------------------------------+------------+-------------+
| freelancer_id | freelancer_name | email_id              | skills                        | experience | hourly_rate |
+---------------+-----------------+-----------------------+-------------------------------+------------+-------------+
|             4 | Sneha Patel     | sneha.patel@gmail.com | UI/UX Design, Figma, Adobe XD |          6 |        1200 |
|             5 | Karan Mehta     | karan.mehta@gmail.com | SAP ABAP, SQL                 |          7 |        1500 |
|             9 | Rohit Nair      | rohit.nair@gmail.com  | PHP, Laravel, MySQL           |          6 |         950 |
+---------------+-----------------+-----------------------+-------------------------------+------------+-------------+
  
-- 5. Find freelancers charging more than 1000 per hour
SELECT * FROM freelancer_details
WHERE hourly_rate > 1000;

-- 6. Display freelancers from highest to lowest hourly rate
SELECT * FROM freelancer_details
ORDER BY hourly_rate DESC;

-- 7. Display freelancers from lowest to highest hourly rate
SELECT * FROM freelancer_details
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
