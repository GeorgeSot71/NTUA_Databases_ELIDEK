CREATE INDEX  idx_scientific_field_name
ON scientific_field (scientific_field_name);

CREATE INDEX  idx_project_name
ON project (title);

CREATE INDEX  idx_researcher_fullname
ON researcher (name,surname);

CREATE INDEX  idx_program_name
ON program (program_name);
