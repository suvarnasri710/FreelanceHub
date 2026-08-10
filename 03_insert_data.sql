USE freelancer;

-- ============================================
-- CLIENT DATA
-- ============================================

INSERT INTO client_details
(client_id, client_name, company, email_id, phone, country)
VALUES
(1, 'John Smith', 'TechNova Solutions',
 'john.smith_technova@gmail.com', 1202550147, 'USA'),

(2, 'Emily Johnson', 'Bright Media',
 'emily_brightmedia@gmail.com', 165550281, 'Canada'),

(3, 'David Lee', 'Lee Digital Agency',
 'davidlee_lda@gmail.com', 770090123, 'UK'),

(4, 'Sarah Williams', 'Creative Minds',
 'sarah_creativeminds@gmail.com', 1412555876, 'Australia'),

(5, 'Michael Brown', 'Vision Tech',
 'michael_visiontech@gmail.com', 4915156789, 'Germany'),

(6, 'Priya Sharma', 'NextGen Software',
 'priya_nextgen@gmail.com', 9876543210, 'India'),

(7, 'Ahmed Hassan', 'Nile IT Solutions',
 'ahmed_nileit.eg@gmail.com', 105557788, 'Egypt'),

(8, 'Sophia Garcia', 'Pixel Studio',
 'sophia_pixelstudio.es@gmail.com', 4612555334, 'Spain'),

(9, 'Daniel Kim', 'SmartApps Korea',
 'daniel_smartapps.kr@gmail.com', 105556677, 'Korea'),

(10, 'Olivia Wilson', 'CloudBridge Ltd',
 'olivia_cloudbridge.co.nz@gmail.com', 642155598, 'USA');


-- ============================================
-- FREELANCER DATA
-- ============================================

INSERT INTO freelancer_details
(freelancer_id, freelancer_name, email_id, skills, experience, hourly_rate)
VALUES
(1, 'Rahul Sharma', 'rahul.sharma@gmail.com',
 'Java, SQL, Spring Boot', 5, 900),

(2, 'Priya Reddy', 'priya.reddy@gmail.com',
 'Python, Django, PostgreSQL', 4, 850),

(3, 'Arjun Kumar', 'arjun.kumar@gmail.com',
 'HTML, CSS, JavaScript, React', 3, 700),

(4, 'Sneha Patel', 'sneha.patel@gmail.com',
 'UI/UX Design, Figma, Adobe XD', 6, 1200),

(5, 'Karan Mehta', 'karan.mehta@gmail.com',
 'SAP ABAP, SQL', 7, 1500),

(6, 'Neha Verma', 'neha.verma@gmail.com',
 'Data Analysis, SQL, Power BI', 4, 950),

(7, 'Vivek Singh', 'vivek.singh@gmail.com',
 'Java, Android, Firebase', 5, 1000),

(8, 'Ananya Das', 'ananya.das@gmail.com',
 'Machine Learning, Python, TensorFlow', 2, 1100),

(9, 'Rohit Nair', 'rohit.nair@gmail.com',
 'PHP, Laravel, MySQL', 6, 950),

(10, 'Divya Joshi', 'divya.joshi@gmail.com',
 'Node.js, Express.js, MongoDB', 3, 800);


-- ============================================
-- PROJECT DATA
-- ============================================

INSERT INTO project_details
(client_id, freelancer_id, project_name, description,
 start_date, deadline, budget, status)
VALUES

(1, 3, 'Company Website',
 'Develop a responsive company website',
 '2026-08-01', '2026-08-30', 5000.00, 'In Progress'),

(2, 1, 'Banking Software',
 'Develop backend services for banking application',
 '2026-07-15', '2026-09-15', 12000.00, 'In Progress'),

(3, 4, 'Mobile App UI Design',
 'Design user interface for mobile application',
 '2026-07-20', '2026-08-20', 3500.00, 'Completed'),

(4, 2, 'E-Commerce Website',
 'Develop an online shopping website',
 '2026-08-05', '2026-10-05', 9000.00, 'Pending'),

(5, 5, 'SAP Reporting System',
 'Develop custom SAP ABAP reports',
 '2026-08-01', '2026-08-25', 7000.00, 'In Progress'),

(6, 6, 'Sales Dashboard',
 'Create an interactive sales dashboard',
 '2026-07-25', '2026-08-25', 4000.00, 'Completed'),

(7, 7, 'Android Food App',
 'Develop an Android food delivery application',
 '2026-08-01', '2026-10-01', 11000.00, 'Pending'),

(8, 8, 'AI Customer Chatbot',
 'Develop an AI-powered customer support chatbot',
 '2026-08-10', '2026-10-10', 15000.00, 'In Progress'),

(9, 9, 'Inventory Management System',
 'Develop an inventory management application',
 '2026-07-10', '2026-08-30', 6500.00, 'Completed'),

(10, 10, 'REST API Development',
 'Develop REST APIs for business applications',
 '2026-08-05', '2026-09-05', 5500.00, 'Pending');



 select * from client_details;
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
10 rows in set (0.010 sec)

mysql> select * from freelancer_details;
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
10 rows in set (0.007 sec)

mysql> select * from project_details;
+------------+-----------+---------------+--------------------+------------------------------------+------------+------------+----------+-------------+
| project_id | client_id | freelancer_id | project_name       | description                        | start_date | deadline   | budget   | status      |
+------------+-----------+---------------+--------------------+------------------------------------+------------+------------+----------+-------------+
|          1 |         1 |             3 | Company Website    | Develop responsive company website | 2026-07-01 | 2026-08-15 |  5000.00 | In Progress |
|          2 |         2 |             1 | Banking Software   | Backend API Development            | 2026-06-20 | 2026-09-10 | 12000.00 | In Progress |
|          3 |         3 |             4 | Mobile UI Design   | Design Android application screens | 2026-07-05 | 2026-07-30 |  3500.00 | Completed   |
|          4 |         4 |             2 | E-commerce Website | Python Django project              | 2026-07-10 | 2026-09-05 |  9000.00 | Pending     |
|          5 |         5 |             5 | SAP Report         | Custom SAP ABAP reports            | 2026-07-08 | 2026-08-20 |  7000.00 | In Progress |
|          6 |         6 |             6 | Sales Dashboard    | Power BI dashboard                 | 2026-07-12 | 2026-08-10 |  4000.00 | Completed   |
|          7 |         7 |             7 | Android App        | Food delivery application          | 2026-07-15 | 2026-09-20 | 11000.00 | Pending     |
|          8 |         8 |             8 | AI Chatbot         | Customer Support Chatbot           | 2026-07-18 | 2026-09-15 | 15000.00 | In Progress |
|          9 |         9 |             9 | Inventory System   | Laravel inventory management       | 2026-07-09 | 2026-08-30 |  6500.00 | Completed   |
|         10 |        10 |            10 | Node API           | REST API Development               | 2026-07-14 | 2026-08-25 |  5500.00 | Pending     |
+------------+-----------+---------------+--------------------+------------------------------------+------------+------------+----------+-------------+
10 rows in set (0.007 sec)

mysql> select * from payments;
+------------+------------+---------+--------------+----------------+----------------+
| payment_id | project_id | amount  | payment_date | payment_method | payment_status |
+------------+------------+---------+--------------+----------------+----------------+
|          1 |          1 | 2500.00 | 2026-07-10   | Bank Transfer  | Paid           |
|          2 |          2 | 5000.00 | 2026-07-05   | UPI            | Paid           |
|          3 |          3 | 3500.00 | 2026-07-30   | PayPal         | Paid           |
|          4 |          4 | 2000.00 | 2026-07-20   | Card           | Pending        |
|          5 |          5 | 3000.00 | 2026-07-18   | Bank Transfer  | Paid           |
|          6 |          6 | 4000.00 | 2026-08-10   | UPI            | Paid           |
|          7 |          7 | 5000.00 | 2026-07-25   | PayPal         | Pending        |
|          8 |          8 | 7000.00 | 2026-07-22   | Card           | Paid           |
|          9 |          9 | 6500.00 | 2026-08-30   | Bank Transfer  | Paid           |
|         10 |         10 | 2500.00 | 2026-07-28   | UPI            | Pending        |
+------------+------------+---------+--------------+----------------+----------------+
10 rows in set (0.008 sec)

mysql> select * from project_tasks;
+---------+------------+------------------+---------------+------------+-------------+
| task_id | project_id | task_name        | assigned_date | due_date   | task_status |
+---------+------------+------------------+---------------+------------+-------------+
|       1 |          1 | Homepage Design  | 2026-07-01    | 2026-07-08 | Completed   |
|       2 |          1 | Contact Page     | 2026-07-08    | 2026-07-12 | Completed   |
|       3 |          2 | Database Design  | 2026-06-20    | 2026-06-30 | Completed   |
|       4 |          3 | Wireframe Design | 2026-07-05    | 2026-07-10 | Completed   |
|       5 |          4 | Login Module     | 2026-07-10    | 2026-07-20 | Pending     |
|       6 |          5 | Sales Report     | 2026-07-08    | 2026-07-15 | Completed   |
|       7 |          6 | Dashboard Design | 2026-07-12    | 2026-07-25 | Completed   |
|       8 |          7 | Payment Module   | 2026-07-15    | 2026-08-05 | Pending     |
|       9 |          8 | Model Training   | 2026-07-18    | 2026-08-20 | In Progress |
|      10 |          9 | Inventory CRUD   | 2026-07-09    | 2026-07-25 | Completed   |
+---------+------------+------------------+---------------+------------+-------------+
10 rows in set (0.007 sec)

mysql> select * from reviews;
+-----------+------------+--------+---------------------+-------------+
| review_id | project_id | rating | feedback            | review_date |
+-----------+------------+--------+---------------------+-------------+
|         1 |          3 |      5 | Excellent Work      | 2026-07-31  |
|         2 |          6 |      4 | Very Good Dashboard | 2026-08-11  |
|         3 |          9 |      5 | Delivered on Time   | 2026-08-31  |
|         4 |          5 |      4 | Good SAP Reports    | 2026-08-21  |
|         5 |          1 |      5 | Outstanding Website | 2026-08-16  |
+-----------+------------+--------+---------------------+-------------+
5 rows in set (0.007 sec)

mysql> SELECT freelancer_name, skills, hourly_rate
    -> FROM freelancer_details;
+-----------------+--------------------------------------+-------------+
| freelancer_name | skills                               | hourly_rate |
+-----------------+--------------------------------------+-------------+
| Rahul Sharma    | Java, SQL, Spring Boot               |         900 |
| Priya Reddy     | Python, Django, PostgreSQL           |         850 |
| Arjun Kumar     | HTML, CSS, JavaScript, React         |         700 |
| Sneha Patel     | UI/UX Design, Figma, Adobe XD        |        1200 |
| Karan Mehta     | SAP ABAP, SQL                        |        1500 |
| Neha Verma      | Data Analysis, SQL, Power BI         |         950 |
| Vivek Singh     | Java, Android, Firebase              |        1000 |
| Ananya Das      | Machine Learning, Python, TensorFlow |        1100 |
| Rohit Nair      | PHP, Laravel, MySQL                  |         950 |
| Divya Joshi     | Node.js, Express.js, MongoDB         |         800 |
+-----------------+--------------------------------------+-------------+
