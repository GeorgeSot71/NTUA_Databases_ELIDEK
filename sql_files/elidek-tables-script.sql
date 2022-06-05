DROP DATABASE elidek;
CREATE DATABASE elidek;
USE elidek;

CREATE TABLE program(
    program_id INT NOT NULL AUTO_INCREMENT,
    program_name VARCHAR(300) NOT NULL,
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
    birthday DATE NOT NULL,
    sex VARCHAR(30) NOT NULL,
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
    abbreviation VARCHAR(50) NOT NULL,
    budget DECIMAL(13,2) NOT NULL CHECK (budget>0),
    PRIMARY KEY (abbreviation),
    FOREIGN KEY (abbreviation)
        REFERENCES organization(abbreviation) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE scientific_center (
    abbreviation VARCHAR(50) NOT NULL,
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
    title VARCHAR(100) NOT NULL,
    summary TEXT NOT NULL,
    funding DECIMAL(10,2) NOT NULL CHECK (funding >= 100000 AND funding <= 1000000) ,
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
    title VARCHAR(100) NOT NULL,
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
    grade DECIMAL(4,2) NOT NULL CHECK (grade>=0 AND grade<=10),
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

DELIMITER $$
/* 1 */
CREATE TRIGGER same_evaluator_researcher_insert BEFORE INSERT ON evaluate_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
											    FROM works_on_project
                                                WHERE works_on_project.project_id = NEW.project_id)
                                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot add an evaluator that already works on project' ;
		END IF;
	END;$$

/* 2 */
CREATE TRIGGER same_researcher_evaluator_insert BEFORE INSERT ON works_on_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
											    FROM evaluate_project
                                                WHERE evaluate_project.project_id = NEW.project_id)
                                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot add a researcher that is already evaluator in the same project' ;
        END IF;
	END;$$

    /* 3 */
    CREATE TRIGGER researcher_in_project_and_not_in_organisation_insert BEFORE INSERT ON works_on_project
		FOR EACH ROW
        BEGIN
			IF NEW.researcher_id  NOT IN (SELECT researcher_id
																FROM employee_relation INNER JOIN project p ON p.abbreviation = employee_relation.abbreviation
                                                                WHERE p.project_id = NEW.project_id )
																THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot assign a researcher as working on a project if he/she is not working for the organization that manages the project' ;
			END IF;
		END;$$

	/* 4 */
    CREATE TRIGGER scientific_inspector_in_project_and_not_in_organisation_insert BEFORE INSERT ON project
		FOR EACH ROW
        BEGIN
			IF NEW.scientific_inspector_id  NOT IN (SELECT researcher_id
																FROM employee_relation
                                                                WHERE abbreviation = NEW.abbreviation)
																THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot assign a scientific inspector on a project if he/she is not working for the organization that manages the project' ;
			END IF;
	END;$$

    /* 5 */
	CREATE TRIGGER researcher_in_two_different_organisation_insert BEFORE INSERT ON employee_relation
		FOR EACH ROW
        BEGIN
			IF NEW.researcher_id IN (SELECT researcher_id
									FROM employee_relation )
									THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot assign a researcher to work on two different organizations' ;
			END IF;
	END;$$

	/* 6 */
    CREATE TRIGGER same_evaluator_researcher_update BEFORE UPDATE ON evaluate_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
							    FROM works_on_project
                                WHERE works_on_project.project_id = NEW.project_id)
                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot make a researcher evaluate a project if he/she already works on it' ;
		END IF;
	END;$$

/* 7 */
CREATE TRIGGER same_researcher_evaluator_update BEFORE UPDATE ON works_on_project
    FOR EACH ROW
    BEGIN
		IF NEW.researcher_id IN (SELECT researcher_id
							    FROM evaluate_project
                                WHERE evaluate_project.project_id = NEW.project_id)
                                THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot make a researcher work on a project in which he/she is already evaluator';
		END IF;
	END;$$

   /* 8*/
    CREATE TRIGGER researcher_in_project_and_not_in_organisation_update BEFORE UPDATE ON works_on_project
		FOR EACH ROW
        BEGIN
			IF NEW.researcher_id  NOT IN (SELECT researcher_id
										FROM employee_relation INNER JOIN project p ON p.abbreviation = employee_relation.abbreviation
                                        WHERE p.project_id = NEW.project_id )
										THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot make a researcher work on a project if he/she is not working for the organization that manages the project' ;
			END IF;
		END;$$

	/* 9 */
    CREATE TRIGGER scientific_inspector_in_project_and_not_in_organisation_update BEFORE UPDATE ON project
		FOR EACH ROW
        BEGIN
			IF NEW.scientific_inspector_id  NOT IN (SELECT er.researcher_id
													FROM employee_relation er
                                                    WHERE NEW.abbreviation = er.abbreviation)
													THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot make a scientific inspector on a project if he/she is not working for the organization that manages the project';
			END IF;
	END;$$

/* 10 */
CREATE TRIGGER researcher_in_two_different_organisation_update BEFORE UPDATE ON employee_relation
		FOR EACH ROW
        BEGIN
			IF NEW.researcher_id IN (SELECT researcher_id FROM employee_relation) AND NEW.abbreviation != OLD.abbreviation
									THEN SIGNAL SQLSTATE '45000'  SET MESSAGE_TEXT = 'You cannot make researcher to work on two different organizations' ;
			END IF;
	END;$$
DELIMITER ;


CREATE VIEW projects_per_researcher
AS
SELECT r.name, r.surname, p.title
FROM researcher r, project p
WHERE r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = p.project_id)
ORDER BY r.researcher_id;

CREATE VIEW organization_info
AS
SELECT org.abbreviation ,org.name ,org.post_code, org.road, org.town, ph.phone_number
FROM organization org
LEFT JOIN
phone ph
ON ph.abbreviation = org.abbreviation;

CREATE INDEX  idx_scientific_field_name
ON scientific_field (scientific_field_name);

CREATE INDEX  idx_project_title
ON project (title);

CREATE INDEX  idx_researcher_fullname
ON researcher (name,surname);

CREATE INDEX  idx_program_name
ON program (program_name);

CREATE INDEX  idx_project_start_date
ON project (start_date);
