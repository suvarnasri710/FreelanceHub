USE freelancer;

CREATE TABLE client_details (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(50),
    company VARCHAR(100),
    email_id VARCHAR(100),
    phone BIGINT,
    country VARCHAR(50)
);

CREATE TABLE freelancer_details (
    freelancer_id INT PRIMARY KEY,
    freelancer_name VARCHAR(50),
    email_id VARCHAR(100),
    skills VARCHAR(150),
    experience INT,
    hourly_rate INT
);

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

CREATE TABLE project_tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    task_name VARCHAR(100),
    assigned_date DATE,
    due_date DATE,
    task_status VARCHAR(20),

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    rating INT,
    feedback VARCHAR(255),
    review_date DATE,

    FOREIGN KEY (project_id) REFERENCES project_details(project_id)
);
