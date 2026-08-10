# 🚀 FreelanceHub – Freelancer Project Management System

**FreelanceHub** is a SQL-based Freelancer Project Management System designed to manage the complete lifecycle of freelance projects.

The system stores and manages information about **clients, freelancers, projects, tasks, payments, and reviews** using a relational database.

---

## 📌 Project Overview

FreelanceHub is designed to simplify the management of freelance work between clients and freelancers.

A client can have multiple projects, and each project can be assigned to a freelancer. Projects can contain multiple tasks, receive payments, and have reviews after completion.

### Simple Project Flow

```text
Client
   ↓
Creates Project
   ↓
Assigns Freelancer
   ↓
Project Tasks
   ↓
Payments
   ↓
Project Completion
   ↓
Client Review
```

---

## 🎯 Objectives

The main objectives of FreelanceHub are:

* Manage client information
* Manage freelancer information
* Create and track projects
* Assign freelancers to projects
* Track project tasks and deadlines
* Record project payments
* Store client reviews and ratings
* Maintain relationships between different entities
* Practice real-world SQL and database concepts

---

## 🗄️ Database

**Database Name:** `freelancer`

The project uses **MySQL** as the database management system.

### Tables

| Table                | Description                                   |
| -------------------- | --------------------------------------------- |
| `client_details`     | Stores client information                     |
| `freelancer_details` | Stores freelancer information                 |
| `project_details`    | Stores project information and assignments    |
| `project_tasks`      | Stores individual tasks belonging to projects |
| `payments`           | Stores project payment information            |
| `reviews`            | Stores client reviews and ratings             |

---

## 🔗 Database Relationships

The main relationships between the tables are:

```text
client_details
       │
       │ client_id
       ↓
project_details
       ↑
       │ freelancer_id
       │
freelancer_details

project_details
       │
       ├──────────→ project_tasks
       │
       ├──────────→ payments
       │
       └──────────→ reviews
```

### Relationships

* One **client** can have multiple projects.
* One **freelancer** can work on multiple projects.
* One **project** can contain multiple tasks.
* One **project** can have multiple payment records.
* A completed project can have a review.

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* MySQL Workbench / MySQL Command Line
* Git & GitHub

---

## 💻 SQL Concepts Used

This project demonstrates various SQL and database concepts, including:

### Basic SQL

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`

### Database Constraints

* Primary Keys
* Foreign Keys
* `NOT NULL`
* `UNIQUE`
* `AUTO_INCREMENT`

### SQL Operations

* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `LIMIT`
* Aggregate Functions

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`

### Advanced SQL

* Subqueries
* `CASE`
* Views
* Stored Procedures
* Triggers
* Transactions
* Indexes
* Window Functions

---

## 📂 Project Structure

```text
FreelanceHub/
│
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── 03_insert_data.sql
│
├── queries/
│   ├── 01_basic_queries.sql
│   ├── 02_aggregate_queries.sql
│   ├── 03_join_queries.sql
│   ├── 04_subqueries.sql
│   └── 05_advanced_queries.sql
│
├── views/
│   └── project_views.sql
│
├── procedures/
│   └── stored_procedures.sql
│
├── triggers/
│   └── triggers.sql
│
├── diagrams/
│   └── er_diagram.png
│
├── screenshots/
│
└── README.md
```

---

## 🚀 How to Run the Project

### 1. Clone the repository

```bash
git clone <your-github-repository-url>
```

### 2. Open MySQL

Open MySQL Workbench or MySQL Command Line.

### 3. Create the database

```sql
CREATE DATABASE freelancer;
USE freelancer;
```

### 4. Create the tables

Run the SQL script from:

```text
database/02_create_tables.sql
```

### 5. Insert sample data

Run:

```text
database/03_insert_data.sql
```

### 6. Execute SQL queries

The queries are organized inside the `queries` folder.

---

## 📊 Example Query

The following query displays the project name along with the client and freelancer assigned to it:

```sql
SELECT
    p.project_id,
    p.project_name,
    c.client_name,
    f.freelancer_name,
    p.budget,
    p.status
FROM project_details p
JOIN client_details c
    ON p.client_id = c.client_id
JOIN freelancer_details f
    ON p.freelancer_id = f.freelancer_id;
```

### Example Output

```text
+------------+--------------------+----------------+-----------------+----------+-------------+
| project_id | project_name       | client_name    | freelancer_name | budget   | status      |
+------------+--------------------+----------------+-----------------+----------+-------------+
| 1          | Company Website    | John Smith     | Arjun Kumar     | 5000.00  | In Progress |
| 2          | Banking Software   | Emily Johnson  | Rahul Sharma   | 12000.00 | Completed   |
+------------+--------------------+----------------+-----------------+----------+-------------+
```

---

## 📈 Key Features

### 👤 Client Management

Store and manage:

* Client name
* Company
* Email
* Phone
* Country

### 👨‍💻 Freelancer Management

Store and manage:

* Freelancer name
* Email
* Skills
* Experience
* Hourly rate

### 📋 Project Management

Track:

* Project name
* Client
* Assigned freelancer
* Start date
* Deadline
* Budget
* Project status

### ✅ Task Management

Track:

* Task name
* Assigned date
* Due date
* Task status

### 💰 Payment Management

Track:

* Payment amount
* Payment date
* Payment method
* Payment status

### ⭐ Review Management

Store:

* Rating
* Client feedback
* Review date

---

## 🔮 Future Enhancements

The project can be extended with:

* Freelancer skill-based project matching
* Automatic payment calculations
* Freelancer availability tracking
* Project notifications
* Invoice generation
* Freelancer performance reports
* Admin dashboard
* Web-based frontend
* REST API integration

---

## 🎓 Academic Purpose

This project was developed as a **Database Management System / SQL project** to demonstrate the practical implementation of relational database concepts and SQL.

It focuses on designing a structured database and retrieving meaningful information using SQL queries.

---

## 👩‍💻 Author

**Suvarna Sri Kandula**

B.Tech – Computer Science

---

## ⭐ Project Status

**🚧 Currently under development**

More SQL queries, views, stored procedures, triggers, and database features will be added as the project progresses.

---

## 📜 License

This project is created for educational and learning purposes.
