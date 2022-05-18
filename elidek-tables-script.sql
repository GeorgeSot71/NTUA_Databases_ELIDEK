CREATE DATABASE elidek;
GO
USE elidek;

CREATE TABLE project (
    project_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    summary VARCHAR(100000) NOT NULL,
    funding MONEY NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    abbreviation VARCHAR(30) NOT NULL,
    duration VARCHAR(50),
    program_id INT NOT NULL,
    executive_id INT NOT NULL,
    program_id INT NOT NULL,
    scientific_inspector_id INT NOT NULL,
    PRIMARY KEY (project_id),
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
    FOREIGN KEY (executive_id),
        REFERENCES executive(executive_id)
    FOREIGN KEY (program_id),
        REFERENCES program(program_id)
    FOREIGN KEY (scientific_inspector_id),
        REFERENCES researcher(researcher_id)
)

CREATE TABLE organization (
    /*
    yparxei kai to option na xrisimopoiisoume organization_id ws primary key
    organization_id INT NOT NULL AUTO_INCREMENT,
    */
    abbreviation VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    post_code INT NOT NULL,
    road VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL,
    PRIMARY KEY (abbreviation)
)

CREATE TABLE phone (
    abbreviation VARCHAR(30) NOT NULL,
    phone_number BIGINT NOT NULL,
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
    /* https://dev.mysql.com/doc/refman/8.0/en/example-foreign-keys.html */
)

CREATE TABLE researcher (
    researcher_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    age INT,
    surname VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    PRIMARY KEY (researcher_id)
)

CREATE TABLE employee_relation (
    researcher_id INT NOT NULL,
    abbreviation VARCHAR(30) NOT NULL,
    start_working_date DATE NOT NULL,
    FOREIGN KEY (researcher_id),
        REFERENCES researcher(researcher_id)
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
)

CREATE TABLE deliverable (
    title VARCHAR(30) NOT NULL,
    summary VARCHAR(100000) NOT NULL,
    delivery_date DATE NOT NULL,
    project_id INT NOT NULL,
    PRIMARY KEY (title),
    FOREIGN KEY (project_id),
        REFERENCES project(project_id)
)

CREATE TABLE program(
    program_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    adress VARCHAR(30) NOT NULL
)

CREATE TABLE university (
    abbreviation VARCHAR(30) NOT NULL,
    budget MONEY NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
)

CREATE TABLE scientific_center (
    abbreviation VARCHAR(30) NOT NULL,
    budget_ministry MONEY NOT NULL,
    budget_private MONEY NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
)

CREATE TABLE company (
    abbreviation VARCHAR(30) NOT NULL,
    private funding MONEY NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation),
        REFERENCES organization(abbreviation)
)

CREATE TABLE works_on_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    FOREIGN KEY (project_id)
        REFERENCES project(project_id)
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id)
)

CREATE TABLE evaluate_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    evaluation_date DATE NOT NULL,
    grade INT NOT NULL,
    FOREIGN KEY (project_id)
        REFERENCES project(project_id)
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id)
)

CREATE TABLE executive (
    executive_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    PRIMARY KEY (executive_id)
)

CREATE TABLE scientific_field (
    project_id INT NOT NULL,
    scientific_field_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (project_id)
        REFERENCES project(project_id)
)
