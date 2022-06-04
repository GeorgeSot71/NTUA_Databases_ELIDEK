/* QUERY 1 */
SELECT  * FROM program;

SELECT r.researcher_id,r.name,r.surname,p.project_id, p.title
FROM researcher r, project p
WHERE 
	r.researcher_id IN (SELECT researcher_id 
										  FROM works_on_project 
                                          WHERE project_id  IN 
															(SELECT project_id 
															 FROM project 
															 WHERE project_id = p.project_id 
																AND executive_id= p.executive_id
                                                                AND MONTH(start_date) = MONTH(p.start_date) 
																AND YEAR(start_date) = YEAR(p.start_date) 
																AND (YEAR(end_date) - YEAR(start_date))=(YEAR(p.end_date) - YEAR(p.start_date))))
/*AND p.project_id = 1 
AND MONTH(p.start_date) =MONTH('2021-10-17')
AND YEAR(p.start_date) =YEAR('2021-10-14') 
AND (YEAR(p.end_date) - YEAR(p.start_date)) = 2 */
AND  p.executive_id = 1;
 
 
  
/*QUERY 3.2_1*/
SELECT * FROM projects_per_researcher;

/*QUERY 3.2_2*/
SELECT * FROM organization_info;


/*QUERY 3.3*/
SELECT sf.scientific_field_name, r.researcher_id,r.name, r.surname, p.project_id, p.title
FROM scientific_field sf, researcher r, project p
WHERE
     p.project_id = sf.project_id
 AND sf.scientific_field_name = 'Physics'
 AND YEAR(p.end_date) >= YEAR('2022-06-10')
 AND MONTH(p.end_date) > MONTH('2022-06-10')
 AND r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = p.project_id)
 LIMIT 10;


/* QUERY 3.4 */
SELECT COUNT(DISTINCT(p1.project_id)),  COUNT(DISTINCT(p2.project_id)), organ.abbreviation, organ.name, YEAR(p1.start_date), YEAR(p2.start_date)
FROM project p1 
INNER JOIN organization organ
ON  p1.abbreviation = organ.abbreviation
INNER JOIN project p2
ON  p2.abbreviation = organ.abbreviation AND (YEAR(p1.start_date) - YEAR(p2.start_date)) = 1
GROUP BY p1.abbreviation, YEAR(p1.start_date), YEAR(p2.start_date)
HAVING 
		COUNT(DISTINCT(p1.project_id)) =  COUNT(DISTINCT(p2.project_id)) 
        AND COUNT(DISTINCT(p1.project_id)) >= 10;

/*QUERY 3.5*/
SELECT scf1.scientific_field_name, scf2.scientific_field_name,SUM(p.funding)
FROM project p, scientific_field scf1, scientific_field scf2
WHERE scf1.project_id =scf2.project_id 
	AND scf1.scientific_field_name > scf2.scientific_field_name  
    AND p.project_id = scf1.project_id 
GROUP BY scf1.scientific_field_name,  scf2.scientific_field_name
ORDER BY SUM(p.funding) DESC , scf1.scientific_field_name, scf2.scientific_field_name
LIMIT 3;

/*QUERY 3.6*/
SELECT r.name,r.surname, r.birthday,COUNT(wop.researcher_id)
FROM researcher r, works_on_project wop
WHERE r.researcher_id = wop.researcher_id
	AND YEAR(r.birthday) > YEAR('1982-06-10')
GROUP BY r.researcher_id
ORDER BY COUNT(wop.researcher_id) DESC;

/*QUERY 3.7*/
SELECT ex.name,ex.surname,org.name, SUM(p.funding)
FROM executive ex, organization org, project p
WHERE  ex.executive_id = p.executive_id 
	AND org.abbreviation = p.abbreviation
    AND org.abbreviation IN (SELECT abbreviation FROM company)
GROUP BY ex.name, org.name
ORDER BY SUM(p.funding) DESC
LIMIT 5;

/*QUERY 3.8*/
SELECT r.researcher_id, COUNT(wop.researcher_id)
FROM researcher r, works_on_project wop
WHERE r.researcher_id = wop.researcher_id
    AND wop.project_id NOT IN (SELECT project_id FROM delivered)
GROUP BY r.researcher_id HAVING COUNT(wop.researcher_id) >= 5;
