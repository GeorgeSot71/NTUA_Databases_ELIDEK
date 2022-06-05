DROP DATABASE elidek;
CREATE DATABASE elidek;
USE elidek;

CREATE TABLE program(
    program_id INT NOT NULL AUTO_INCREMENT,
    program_name VARCHAR(30) NOT NULL,
    adress VARCHAR(30) NOT NULL,
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
    /*name VARCHAR(30) NOT NULL,
    age INT,
    surname VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL,
    sex VARCHAR(10) NOT NULL, */
    PRIMARY KEY (researcher_id)
)ENGINE=INNODB;

CREATE TABLE organization (
    /*
    yparxei kai to option na xrisimopoiisoume organization_id ws primary key
    organization_id INT NOT NULL AUTO_INCREMENT,
    */
    abbreviation VARCHAR(30) NOT NULL,
    /*name VARCHAR(30) NOT NULL,
    post_code INT NOT NULL,
    road VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL, */
    PRIMARY KEY (abbreviation)
)ENGINE=INNODB;

CREATE TABLE phone (
    abbreviation VARCHAR(30) NOT NULL,
    phone_number BIGINT NOT NULL,
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation)
    /* https://dev.mysql.com/doc/refman/8.0/en/example-foreign-keys.html */
)ENGINE=INNODB;

CREATE TABLE university (
    abbreviation VARCHAR(30) NOT NULL,
    budget DECIMAL(13,2) NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation)
)ENGINE=INNODB;

CREATE TABLE scientific_center (
    abbreviation VARCHAR(30) NOT NULL,
    budget_ministry DECIMAL(13,2) NOT NULL,
    budget_private DECIMAL(13,2) NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation)
)ENGINE=INNODB;

CREATE TABLE company (
    abbreviation VARCHAR(30) NOT NULL,
    private_funding DECIMAL(13,2) NOT NULL,
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation)
)ENGINE=INNODB;

CREATE TABLE employee_relation (
    researcher_id INT NOT NULL,
    abbreviation VARCHAR(30) NOT NULL,
    /*start_working_date DATE NOT NULL,*/
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation)
)ENGINE=INNODB;

CREATE TABLE project (
    project_id INT NOT NULL AUTO_INCREMENT,
    /*title VARCHAR(30) NOT NULL,
    summary TEXT NOT NULL,
    funding DECIMAL(13,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL, */
    abbreviation VARCHAR(30) NOT NULL,
   /* duration VARCHAR(50),
    executive_id INT NOT NULL,
    program_id INT NOT NULL, 
    scientific_inspector_id INT NOT NULL,*/
    PRIMARY KEY (project_id) ,
    FOREIGN KEY (abbreviation) 
        REFERENCES organization(abbreviation) /*,
    FOREIGN KEY (executive_id)
        REFERENCES executive(executive_id),
    FOREIGN KEY (program_id)
        REFERENCES program(program_id), 
    FOREIGN KEY (scientific_inspector_id)
        REFERENCES researcher(researcher_id)  */
)ENGINE=INNODB;

CREATE TABLE deliverable (
    title VARCHAR(30) NOT NULL,
    summary TEXT NOT NULL,
    delivery_date DATE NOT NULL,
    project_id INT NOT NULL,
    PRIMARY KEY (title, project_id),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id)
)ENGINE=INNODB;

CREATE TABLE works_on_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    FOREIGN KEY (project_id) 
		REFERENCES project(project_id),
    FOREIGN KEY (researcher_id)
		REFERENCES researcher(researcher_id)
)ENGINE=INNODB;

CREATE TABLE evaluate_project(
    project_id INT NOT NULL,
    researcher_id INT NOT NULL,
    /* evaluation_date DATE NOT NULL,
    grade INT NOT NULL,
    */
    PRIMARY KEY (project_id, researcher_id),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id),
    FOREIGN KEY (researcher_id)
        REFERENCES researcher(researcher_id)
)ENGINE=INNODB;

CREATE TABLE scientific_field (
    project_id INT NOT NULL,
    scientific_field_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (project_id)
        REFERENCES project(project_id)
)ENGINE=INNODB;

DELIMITER $$

CREATE TRIGGER same_evaluator_researcher BEFORE INSERT ON evaluate_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
											    FROM works_on_project
                                                WHERE works_on_project.project_id = NEW.project_id) 
                                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'This operation is not allowed. You cannot add an evaluator that almost works on priject ' ;
		END IF;
	END;$$

CREATE TRIGGER same_researcher_evaluator BEFORE INSERT ON works_on_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
											    FROM evaluate_project
                                                WHERE evaluate_project.project_id = NEW.project_id) 
                                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'This operation is not allowed.We cannot add a researcher that is almost evaluator in the same project ' ;
		END IF;
	END;$$
    
    CREATE TRIGGER researcher_in_project_and_not_in_organisation BEFORE INSERT ON works_on_project
		FOR EACH ROW
        BEGIN
			IF NEW.researcher_id  NOT IN (SELECT researcher_id
																FROM employee_relation INNER JOIN project p ON p.abbreviation = employee_relation.abbreviation
                                                                WHERE p.project_id = NEW.project_id )
																THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'This operation is not allowed.It is not good ' ;
			END IF;
		END;$$
																
DELIMITER ;

	INSERT INTO researcher 
    VALUES(12);
	INSERT INTO researcher 
    VALUES(13);
    INSERT INTO organization
    VALUES('EMP');
     INSERT INTO organization
    VALUES('EKPA');
	INSERT INTO project
    VALUES(123,'EMP');
    INSERT INTO project
    VALUES(1234,'EKPA');
    INSERT INTO employee_relation
    VALUES(13,'EMP');
   /* INSERT INTO employee_relation
    VALUES(12,'EMP');
    INSERT INTO works_on_project
    VALUES(123,13); */
    /*INSERT INTO evaluate_project
    VALUES(123,13); */
    INSERT INTO works_on_project
    VALUES(123,13) ;
    INSERT INTO works_on_project
    VALUES(1234,13) ; 
    

    
  SELECT *
  FROM employee_relation INNER JOIN  project ON project.abbreviation = employee_relation.abbreviation
    
    
	
