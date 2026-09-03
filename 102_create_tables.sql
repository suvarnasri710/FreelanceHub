USE freelancer;   --database = freelancer

CREATE TABLE client_details (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(50),
    company VARCHAR(100),
    email_id VARCHAR(100),
    phone BIGINT,
    country VARCHAR(50)
);

| Field       | Type         | Null | Key | Default | Extra |
|      ---    |  ---         |  --- | --- |    ---  |  ---  |
| client_id   | int          | NO   | PRI | NULL    |       |
| client_name | varchar(50)  | YES  |     | NULL    |       |
| company     | varchar(100) | YES  |     | NULL    |       |
| email_id    | varchar(100) | YES  |     | NULL    |       | 
| phone       | bigint       | YES  |     | NULL    |       |
| country     | varchar(50)  | YES  |     | NULL    |       |
------------------------------------------------------------------------
    
CREATE TABLE freelancer_details (
    freelancer_id INT PRIMARY KEY,
    freelancer_name VARCHAR(50),
    email_id VARCHAR(100),
    skills VARCHAR(150),
    experience INT,
    hourly_rate INT
);
| Field           | Type         | Null | Key | Default | Extra |
| ---             | ---          | ---  | --- | ---     | ---   |
| freelancer_id   | int          | NO   | PRI | NULL    |       |
| freelancer_name | varchar(50)  | YES  |     | NULL    |       |
| email_id        | varchar(100) | YES  |     | NULL    |       |
| skills          | varchar(150) | YES  |     | NULL    |       |
| experience      | int          | YES  |     | NULL    |       |
| hourly_rate     | int          | YES  |     | NULL    |       |
------------------------------------------------------------------------
    
CREATE TABLE project_details (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    freelancer_id INT,
    project_name VARCHAR(100),
    description VARCHAR(255),
    start_date DATE,
    deadline DATE,
    budget DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (client_id) REFERENCES client_details(client_id),

    FOREIGN KEY (freelancer_id) REFERENCES freelancer_details(freelancer_id)
);
| Field         | Type          | Null | Key | Default | Extra |
| ---           | ---           | ---  | --- | ---     | --- |
| project_id    | int           | NO   | PRI | NULL    | auto_increment |
| client_id     | int           | YES  | MUL | NULL    |                |
| freelancer_id | int           | YES  | MUL | NULL    |                |
| project_name  | varchar(100)  | YES  |     | NULL    |                |
| description   | varchar(255)  | YES  |     | NULL    |                |
| start_date    | date          | YES  |     | NULL    |                |
| deadline      | date          | YES  |     | NULL    |                |
| budget        | decimal(10,2) | YES  |     | NULL    |                |
| status        | varchar(20)   | YES  |     | NULL    |                |
------------------------------------------------------------------------
    
CREATE TABLE project_tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    task_name VARCHAR(100),
    assigned_date DATE,
    due_date DATE,
    task_status VARCHAR(20),

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);

| Field         | Type         | Null | Key | Default  | Extra          |
| ---           | ---          | ---  | --- | ---      | ---            |
| task_id       | int          | NO   | PRI | NULL     | auto_increment |
| project_id    | int          | YES  | MUL | NULL     |                |
| task_name     | varchar(100) | YES  |     | NULL     |                |
| assigned_date | date         | YES  |     | NULL     |                |
| due_date      | date         | YES  |     | NULL     |                |
| task_status   | varchar(20)  | YES  |     | NULL     |                |
------------------------------------------------------------------------

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);

| Field          | Type          | Null | Key | Default | Extra          |
| ---            | ---           | ---  | --- | ---     | ---            |
| payment_id     | int           | NO   | PRI | NULL    | auto_increment |
| project_id     | int           | YES  | MUL | NULL    |                |
| amount         | decimal(10,2) | YES  |     | NULL    |                |
| payment_date   | date          | YES  |     | NULL    |                |
| payment_method | varchar(30)   | YES  |     | NULL    |                |
| payment_status | varchar(20)   | YES  |     | NULL    |                |
------------------------------------------------------------------------

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    rating INT,
    feedback VARCHAR(255),
    review_date DATE,

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);

| Field       | Type         | Null | Key | Default  | Extra            |
| ---         | ---          | ---  | --- | ---      | ---              |
| review_id   | int          | NO   | PRI | NULL     | auto_increment   |
| project_id  | int          | YES  | MUL | NULL     |                  |
| rating      | int          | YES  |     | NULL     |                  |
| feedback    | varchar(255) | YES  |     | NULL     |                  |
| review_date | date         | YES  |     | NULL     |                  |

