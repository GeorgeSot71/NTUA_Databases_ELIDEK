CREATE VIEW projects_per_researcher
AS
SELECT r.name,r.surname p.project_id, p.title
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
