DROP DATABASE elidek;
CREATE DATABASE elidek;
USE elidek;

CREATE TABLE program(
    program_id INT NOT NULL AUTO_INCREMENT,
    program_name VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL,
    PRIMARY KEY (program_id)
)ENGINE=INNODB;

CREATE TABLE executive (
    executive_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    PRIMARY KEY (executive_id)
)ENGINE=INNODB;

CREATE TABLE researcher (
    researcher_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    age INT CHECK (age>=0),
    birthday DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    PRIMARY KEY (researcher_id)
)ENGINE=INNODB;

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
)ENGINE=INNODB;

CREATE TABLE phone (
    abbreviation VARCHAR(30) NOT NULL,
    phone_number BIGINT NOT NULL,
    PRIMARY KEY (abbreviation, phone_number),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE university (
    abbreviation VARCHAR(30) NOT NULL,
    budget DECIMAL(13,2) NOT NULL CHECK (budget>0),
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE scientific_center (
    abbreviation VARCHAR(30) NOT NULL,
    budget_ministry DECIMAL(13,2) NOT NULL CHECK (budget_ministry>0),
    budget_private DECIMAL(13,2) NOT NULL CHECK (budget_private>0),
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE company (
    abbreviation VARCHAR(30) NOT NULL,
    private_funding DECIMAL(13,2) NOT NULL CHECK (private_funding>0),
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE employee_relation (
    researcher_id INT NOT NULL,
    abbreviation VARCHAR(30) NOT NULL,
    start_working_date DATE NOT NULL,
    PRIMARY KEY (researcher_id, abbreviation),
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE project (
    project_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    summary TEXT NOT NULL,
    funding DECIMAL(7,2) NOT NULL CHECK (funding > 100000 AND funding < 1000000) ,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    abbreviation VARCHAR(30) NOT NULL,
    executive_id INT NOT NULL,
    program_id INT NOT NULL,
    scientific_inspector_id INT NOT NULL,
    PRIMARY KEY (project_id),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (executive_id)
        REFERENCES executive(executive_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (program_id)
        REFERENCES program(program_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (scientific_inspector_id)
        REFERENCES researcher(researcher_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT project_duration_check CHECK ((DATEDIFF(end_date,start_date)>=365) AND DATEDIFF(end_date,start_date)<=1460)
)ENGINE=INNODB;

CREATE TABLE delivered (
    title VARCHAR(30) NOT NULL,
    project_id INT NOT NULL,
    summary TEXT NOT NULL,
    delivery_date DATE NOT NULL,
    PRIMARY KEY (title,project_id),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE works_on_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    PRIMARY KEY (project_id, researcher_id),
    FOREIGN KEY (project_id)
		REFERENCES project(project_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (researcher_id)
		REFERENCES researcher(researcher_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE evaluate_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    grade numeric(2,2) NOT NULL CHECK (grade>=0 AND grade<=10),
    evaluation_date DATE NOT NULL,
    PRIMARY KEY (project_id,researcher_id),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE scientific_field (
    project_id INT NOT NULL,
    scientific_field_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (project_id,scientific_field_name),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;
