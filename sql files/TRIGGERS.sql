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
