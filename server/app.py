from flask import Flask, render_template, request
import mysql.connector, re
from datetime import datetime

app = Flask(__name__)

connection = mysql.connector.connect(host='localhost',database='elidek',
user='root',password='rootroot')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/")
def main():
    return render_template('about.html')

@app.route("/queries")
def queries():
    return render_template('queries.html')

@app.route("/insert")
def insert():
    return render_template('insert.html')

@app.route("/update")
def update():
    return render_template('update.html')

@app.route("/delete")
def delete():
    return render_template('delete.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE


#queries
@app.route("/queries/query1")
def query1():
    return render_template('query1.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/queries/query2a", methods=["GET", "POST"])
def query2a():
    rs = connection.cursor()
    select1 = "SELECT * FROM projects_per_researcher;"
    rs.execute(select1)
    projects_per_researcher = rs.fetchall()
    return render_template('query2a.html', query2a = projects_per_researcher)
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/queries/query2b", methods=["GET", "POST"])
def query2b():
    rs = connection.cursor()
    select1 = "SELECT * FROM organization_info;"
    rs.execute(select1)
    organization_info = rs.fetchall()
    return render_template('query2b.html', query2b = organization_info)
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/queries/query3")
def query3():
    return render_template('query3.html')

@app.route("/queries/query3_result", methods=["GET", "POST"])
def query3_result():
    rs = connection.cursor()
    scf_field = str(request.form.get('type'))

    if(scf_field == "None"):
        return render_template('query3.html')
    if(scf_field == ""):
        return render_template('query3.html')

    scientific_field = (
        "AND sf.scientific_field_name = '{}'".format(scf_field)
        if (scf_field!= "")
        else ""
    )

    everything = " SELECT sf.scientific_field_name, r.researcher_id, r.name, r.surname, p.project_id, p.title FROM scientific_field sf, researcher r, project p WHERE p.project_id = sf.project_id "
    my_query3 = (everything+scientific_field+"AND YEAR(p.end_date) >= YEAR('2022-06-10') AND MONTH(p.end_date) > MONTH('2022-06-10') AND r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = p.project_id);")

    rs.execute(my_query3)
    result3 = rs.fetchall()
    return render_template('query3_result.html', query3 = result3)
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/queries/query4")
def query4():
    rs = connection.cursor()
    query = "SELECT COUNT(DISTINCT(p1.project_id)),  COUNT(DISTINCT(p2.project_id)), organ.abbreviation, organ.name, YEAR(p1.start_date), YEAR(p2.start_date) FROM project p1 INNER JOIN organization organ ON  p1.abbreviation = organ.abbreviation INNER JOIN project p2 ON  p2.abbreviation = organ.abbreviation AND (YEAR(p1.start_date) - YEAR(p2.start_date)) = 1 GROUP BY p1.abbreviation, YEAR(p1.start_date), YEAR(p2.start_date) HAVING COUNT(DISTINCT(p1.project_id)) =  COUNT(DISTINCT(p2.project_id)) AND COUNT(DISTINCT(p1.project_id)) >= 10;"
    rs.execute(query)
    returned_values = rs.fetchall()
    return render_template('query4.html', query4 = returned_values)
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE


@app.route("/queries/query5")
def query5():
    return render_template('query5.html')

@app.route("/queries/query6")
def query6():
    return render_template('query6.html')

@app.route("/queries/query7")
def query7():
    return render_template('query7.html')

@app.route("/queries/query8")
def query8():
    return render_template('query8.html')

#insert
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_program", methods=["GET", "POST"])
def insert_program():
    rs = connection.cursor()
    program_name = str(request.form.get('program_name'))
    program_address = str(request.form.get('program_address'))
    if(program_name == "None" or program_address == "None"):
        return render_template('insert_program.html')
    if(program_name == "" or program_address == ""):
        return render_template('insert_program.html')
    queryString = "INSERT INTO program (program_name, address) VALUES ('"+program_name+"', '"+program_address+"');"
    rs.execute(queryString)
    connection.commit()

    return render_template('insert_program.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_executive", methods=["GET", "POST"])
def insert_executive():
    rs = connection.cursor()
    exec_name = str(request.form.get('exec_name'))
    exec_surname = str(request.form.get('exec_surname'))
    exec_sex = str(request.form.get('exec_sex'))
    birthday = str(request.form.get('exec_birthday'))
    if(exec_name == "None" or exec_surname == "None" or exec_sex == 'None' or birthday == 'None'):
        return render_template('insert_executive.html')
    if(exec_name == "" or exec_surname == "" or exec_sex == '' or birthday == ''):
        return render_template('insert_executive.html')
    queryString = "INSERT INTO `executive` (`name`, `surname`, `birthday`, `sex`) VALUES ('"+exec_name+"', '"+exec_surname+"', '"+birthday+"', '"+exec_sex+"');"
    rs.execute(queryString)
    connection.commit()

    return render_template('insert_executive.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_organization", methods=["GET", "POST"]  )
def insert_organization():
    rs = connection.cursor()
    org_abr = str(request.form.get('abbreviation'))
    org_name = str(request.form.get('name'))
    org_postcode = str(request.form.get('postcode'))
    org_address = str(request.form.get('road'))
    org_town = str(request.form.get('town'))
    org_type = str(request.form.get('type'))
    org_budget1 = str(request.form.get('budget1'))
    org_budget2 = str(request.form.get('budget2'))

    if(org_abr == "None" or org_name == "None" or org_postcode == 'None' or org_address == "None" or org_town == "None" or org_type == "None" or org_budget1 == "None"):
        return render_template('insert_organization.html')
    if(org_abr == "" or org_name == "" or org_postcode == '' or org_address == "" or org_town == "" or org_type == "" or org_budget1 == ""):
        return render_template('insert_organization.html')
    if(org_type == "scientific_center" and org_budget2 == ""):
        return "Missing Value: Please go back and specify the amount of private funds!"
    queryString1 = "INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('"+org_abr+"', '"+org_name+"', "+org_postcode+", '"+org_address+"', '"+org_town+"');"
    if(org_type == "university"):
        query2String = "INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('"+org_abr+"', '"+org_budget1+"');"
    elif(org_type == "company"):
        query2String = "INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('"+org_abr+"', '"+org_budget1+"');"
    elif(org_type == "scientific_center"):
        query2String = "INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('"+org_abr+"', '"+org_budget1+"', '"+org_budget2+"');"
    try:
        rs.execute(queryString1)
        rs.execute(query2String)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "This abbreviation already exist and there CANNOT be 2 distinct organizations with the same abbreviation"
    return render_template('insert_organization.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_phone", methods=["GET", "POST"])
def insert_phone():
    rs = connection.cursor()
    org_abr = str(request.form.get('abbreviation'))
    phone = str(request.form.get('phone'))
    if(org_abr == "None" or phone == "None"):
        return render_template('insert_phone.html')
    if(org_abr == "" or phone == ""):
        return render_template('insert_phone.html')
    queryString = "INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('"+org_abr+"', '"+phone+"');"
    try:
        rs.execute(queryString)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "<h1>This organization abbreviation does not exist, go back and input an existing abbreviation</h1>"
    return render_template('insert_phone.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_project", methods=["GET", "POST"])
def insert_project():
    rs = connection.cursor()
    project_title = str(request.form.get('title'))
    project_summary = str(request.form.get('summary'))
    project_funds = str(request.form.get('funding'))
    start_date = str(request.form.get('start_date'))
    end_date = str(request.form.get('end_date'))
    org_abr = str(request.form.get('abbreviation'))
    exec_name = str(request.form.get('executive_name'))
    exec_surname = str(request.form.get('executive_surname'))
    scientific_inspector_name = str(request.form.get('scientific_inspector_name'))
    scientific_inspector_surname = str(request.form.get('scientific_inspector_surname'))
    program_name = str(request.form.get('program_name'))
    project_field = str(request.form.get('type'))
    eval_date = str(request.form.get('evaluation_date'))
    eval_name = str(request.form.get('evaluator_name'))
    eval_surname = str(request.form.get('evaluator_surname'))
    eval_grade = str(request.form.get('evaluation_grade'))

    #return eval_date+eval_name+eval_surname+eval_grade+project_title+project_summary+project_funds+start_date+end_date+org_abr +exec_name+ exec_surname +project_field + program_name + scientific_inspector_name + scientific_inspector_surname
    #null input check
    if(eval_date == '' or eval_name == '' or eval_surname == '' or eval_grade == '' or project_title == '' or project_summary == '' or project_funds == '' or start_date == '' or end_date == "" or org_abr == "" or exec_name == "" or exec_surname == "" or project_field == "" or program_name == "" or scientific_inspector_name == "" or scientific_inspector_surname == ""):
        return render_template('insert_project.html')
    if(eval_date == 'None' or eval_name == 'None' or eval_surname == 'None' or eval_grade == 'None' or project_title == 'None' or project_summary == 'None' or project_funds == 'None' or start_date == 'None' or end_date == "None" or org_abr == "None" or exec_name == "None" or exec_surname == "None" or project_field == "None" or program_name == "None" or scientific_inspector_name == "None" or scientific_inspector_surname == "None"):
        return render_template('insert_project.html')

    #executive -> executive_id
    select1 = "SELECT executive_id FROM executive WHERE name='"+exec_name+"' AND surname='"+exec_surname+"';"
    rs.execute(select1)
    exec_results = rs.fetchall()
    if (len(exec_results) > 1):
        return "There seems to be more than one executive with the name you specified, please contant database administrators"
    if (len(exec_results) < 1):
        return "An executive with the name you specified does not exist in the database, please contant database administrators"

    #scientific inspector name -> scientific inspector id
    select2 = "SELECT researcher_id FROM researcher WHERE name='"+scientific_inspector_name+"' AND surname='"+scientific_inspector_surname+"';"
    rs.execute(select2)
    inspector_results = rs.fetchall()
    if (len(inspector_results) >1):
        return "There seems to be more than one researcher with the name you specified, please contant database administrators"
    if (len(inspector_results) <1):
        return "A researcher with the name you specified does not exist in the database, please contant database administrators"

    #progran name -> program_id
    select3 = "SELECT program_id FROM program WHERE program_name='"+program_name+"';"
    rs.execute(select3)
    program_id = rs.fetchall()
    if (len(program_id) <  1):
        return "There is not a program with the name you specified, please contact database administrators"

    #insert into project
    insert1 = "INSERT INTO `project` ( `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES ('"+project_title+"', '"+project_summary+"', '"+project_funds+"', '"+start_date+"', '"+end_date+"', '"+org_abr+"', "+str(exec_results[0][0])+", "+str(program_id[0][0])+", "+str(inspector_results[0][0])+");"
    rs.execute(insert1)
    connection.commit()

    #get inserted project_id
    get_project_id = "SELECT LAST_INSERT_ID();"
    rs.execute(get_project_id)
    project_id = rs.fetchall()
    project_id = project_id[0][0]
    #insert into works_on_project
    insert2 = "INSERT INTO `works_on_project`(`project_id`, `researcher_id`) VALUES ("+str(project_id)+", "+str(inspector_results[0][0])+");"
    rs.execute(insert2)
    connection.commit()

    #inser into scientific field
    insert3 = "INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES ("+str(project_id)+", '"+project_field+"');"
    rs.execute(insert3)
    connection.commit()

    #evaluation, get evaluator_id, insert into table
    select4 = "SELECT researcher_id FROM researcher WHERE name='"+eval_name+"' AND surname='"+eval_surname+"';"
    rs.execute(select4)
    evaluator_results = rs.fetchall()
    if (len(evaluator_results) >1):
        return "There seems to be more than one evaluator (researcher) with the name you specified, please contant database administrators"
    if (len(evaluator_results) <1):
        return "An evaluator (researcher) with the name you specified does not exist in the database, please contant database administrators"

    insert4 = "INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES ("+str(project_id)+", "+str(evaluator_results[0][0])+", '"+eval_grade+"', '"+eval_date+"');"
    rs.execute(insert4)
    connection.commit()

    return render_template('insert_project.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_delivered", methods=["GET", "POST"])
def insert_delivered():
    rs = connection.cursor()

    del_title = str(request.form.get('title'))
    del_summary = str(request.form.get('summary'))
    project_name = str(request.form.get('project_name'))
    del_date = str(request.form.get('delivery_date'))

    if(del_title == "None" or del_summary == "None" or project_name == "None" or del_date == "None"):
        return render_template('insert_delivered.html')
    if(del_title == "" or del_summary == "" or project_name == "" or del_date == ""):
        return render_template('insert_delivered.html')

    #get project_id using project_name
    select = "SELECT project_id FROM project WHERE title='"+project_name+"';"
    rs.execute(select)
    project_id = rs.fetchall()
    if(len(project_id)>1):
        return "There seems to be more than one project the that title, please conantact database administrators"
    if(len(project_id)<1):
        return "There doesn't exist a project with the title you specified"

    queryString = "INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('"+del_title+"', '"+del_summary+"', '"+del_date+"', "+str(project_id[0][0])+");"
    rs.execute(queryString)
    connection.commit()

    return render_template('insert_delivered.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_works_on_project", methods=["GET", "POST"])
def insert_works_on_project():
    rs = connection.cursor()

    project_name = str(request.form.get('project_name'))
    researcher_name = str(request.form.get('researcher_name'))
    researcher_surname = str(request.form.get('researcher_surname'))

    if(project_name == "None" or researcher_name == "None" or researcher_surname == "None"):
        return render_template('insert_works_on_project.html')
    if(project_name == "" or researcher_name == "" or researcher_surname == ""):
        return render_template('insert_works_on_project.html')

    #get project_id using project_name
    select = "SELECT project_id FROM project WHERE title='"+project_name+"';"
    rs.execute(select)
    project_id = rs.fetchall()
    if(len(project_id)>1):
        return "There seems to be more than one project the that title, please conantact database administrators"
    if(len(project_id)<1):
        return "There doesn't exist a project with the title you specified"

    #get researcher_id using researcher name
    select2 = "SELECT researcher_id FROM researcher WHERE name='"+researcher_name+"' AND surname='"+researcher_surname+"';"
    rs.execute(select2)
    researcher_results = rs.fetchall()
    if (len(researcher_results) >1):
        return "There seems to be more than one researcher with the name you specified, please contant database administrators"
    if (len(researcher_results) <1):
        return "A researcher with the name you specified does not exist in the database, please contant database administrators"

    insert = "INSERT INTO `works_on_project`(`project_id`, `researcher_id`) VALUES ("+str(project_id[0][0])+", "+str(researcher_results[0][0])+");"
    try:
        rs.execute(insert)
        connection.commit()
    except mysql.connector.errors.DatabaseError as e:
        return str(e)
    return render_template('insert_works_on_project.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_scientific_field", methods=["GET", "POST"])
def insert_scientific_field():
    rs = connection.cursor()
    proj_title = str(request.form.get('title'))
    scf_field = str(request.form.get('type'))
    if(proj_title == "None" or scf_field == "None"):
        return render_template('insert_scientific_field.html')
    if(proj_title == "" or scf_field == ""):
        return render_template('insert_scientific_field.html')

    #project title -> project_id
    select1 = "SELECT project_id FROM project WHERE title='"+proj_title+"';"
    rs.execute(select1)
    project_id = rs.fetchall()
    if (len(project_id) >1):
        return "There seems to be more than one projects with the title you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the title you specified, please contact database administrators"

    queryString = "INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES ("+str(project_id[0][0])+", '"+scf_field+"');"
    try:
        rs.execute(queryString)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "<h1>This project does not exist, go back and input an existing project</h1>"
    return render_template('insert_scientific_field.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_researcher", methods=["GET", "POST"])
def insert_researcher():
    rs = connection.cursor()

    researcher_name = str(request.form.get('name'))
    researcher_surname = str(request.form.get('surname'))
    birthday = str(request.form.get('birthday'))
    sex = str(request.form.get('sex'))

    if(researcher_name == "" or researcher_surname == "" or birthday == "" or sex == ""):
        return render_template('insert_researcher.html')
    if(researcher_name == "None" or researcher_surname == "None" or birthday == "None" or sex == "None"):
        return render_template('insert_researcher.html')


    insert = "INSERT INTO `researcher` (`name`, `surname`, `birthday`, `sex`) VALUES ('"+researcher_name+"', '"+researcher_surname+"', '"+birthday+"', '"+sex+"');"
    rs.execute(insert)
    connection.commit()

    return render_template('insert_researcher.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_employee_relation", methods=["GET", "POST"])
def insert_employee_relation():
    rs = connection.cursor()

    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))
    abbr = str(request.form.get('abbreviation'))
    startWorkingDay = str(request.form.get('start_working_date'))

    if(researcherName == "None" or researcherSurname == "" or abbr == "None" or startWorkingDay== "None"):
        return render_template('insert_employee_relation.html')
    if(researcherName == "" or researcherSurname == "" or abbr == "" or startWorkingDay == ""):
        return render_template('insert_employee_relation.html')

    #researcher_fullname -> researcher_id
    select1 = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select1)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    queryString = "INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES ("+str(researcher_id[0][0])+", '"+abbr+"', '"+startWorkingDay+"');"
    try:
        rs.execute(queryString)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "<h1>The organization with the specified abbreviation does not exist, go back and input an existing abbreviation</h1>"

    return render_template('insert_employee_relation.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

# George added the following just to render the websites

#delete
@app.route("/delete/delete_employee_relation")
def delete_employee_relation():
    return render_template('delete_employee_relation.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_project", methods=["GET", "POST"])
def delete_project():
    rs = connection.cursor()
    project_title = str(request.form.get('title'))
    if(project_title == "None" or project_title == ""):
        return render_template('delete_project.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one project with the title you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"


    delete = "DELETE FROM project WHERE project_id='"+str(project_id[0][0])+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_project.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_delivered", methods=["GET", "POST"])
def delete_delivered():
    rs = connection.cursor()
    delivered_title = str(request.form.get('delivered_title'))
    project_title = str(request.form.get('title'))
    if(delivered_title == "None" or delivered_title == "" or project_title == "None" or project_title == ""):
        return render_template('delete_delivered.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one project with the title you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"

    delete = "DELETE FROM delivered WHERE title='"+delivered_title+"' AND project_id='"+str(project_id[0][0])+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_delivered.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_works_on_project", methods=["GET", "POST"])
def delete_works_on_project():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))

    if(project_title == "None" or project_title == ""):
        return render_template('delete_works_on_project.html')
    if(researcherName == "" or researcherName == ""):
        return render_template('delete_works_on_project.html')
    if(researcherSurname == "" or researcherSurname == ""):
        return render_template('delete_works_on_project.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    select = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select)
    researcher_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one projects with the name you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    delete = "DELETE FROM works_on_project WHERE project_id="+str(project_id[0][0])+" AND researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_works_on_project.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_evaluate_project", methods=["GET", "POST"])
def delete_evaluate_project():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))

    if(project_title == "None" or project_title == ""):
        return render_template('delete_evaluate_project.html')
    if(researcherName == "" or researcherName == ""):
        return render_template('delete_evaluate_project.html')
    if(researcherSurname == "" or researcherSurname == ""):
        return render_template('delete_evaluate_project.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    select = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select)
    researcher_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one projects with the name you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    delete = "DELETE FROM evaluate_project WHERE project_id="+str(project_id[0][0])+" AND researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_evaluate_project.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_scientific_field", methods=["GET", "POST"])
def delete_scientific_field():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    scientific_field = str(request.form.get('type'))

    if(scientific_field == "None" or scientific_field == ""):
        return render_template('delete_scientific_field.html')
    if(project_title == "" or project_title == ""):
        return render_template('delete_scientific_field.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one projects with the name you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"

    delete = "DELETE FROM scientific_field WHERE project_id="+str(project_id[0][0])+" AND scientific_field_name='"+scientific_field+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_scientific_field.html')


#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_researcher", methods=["GET", "POST"])
def delete_researcher():
    rs = connection.cursor()

    researcherName = str(request.form.get('name'))
    researcherSurname = str(request.form.get('surname'))

    if(researcherName == "None" or researcherSurname == ""):
        return render_template('delete_researcher.html')
    if(researcherName == "" or researcherSurname == ""):
        return render_template('delete_researcher.html')

    select = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    delete = "DELETE FROM researcher WHERE researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_researcher.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_phone", methods=["GET", "POST"])
def delete_phone():
    rs = connection.cursor()
    abbreviation = str(request.form.get('abbreviation'))
    phone = str(request.form.get('phone'))

    if(abbreviation == "None" or abbreviation == ""):
        return render_template('delete_phone.html')
    if(phone == "None" or phone == ""):
        return render_template('delete_phone.html')

    delete = "DELETE FROM phone WHERE phone_number="+phone+" AND abbreviation='"+abbreviation+"';"

    rs.execute(delete)
    connection.commit()
    return render_template('delete_phone.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_organization", methods=["GET", "POST"]  )
def delete_organization():
    rs = connection.cursor()

    abbreviation = str(request.form.get('abbreviation'))

    if(abbreviation == "None" or abbreviation == ""):
        return render_template('delete_organization.html')

    delete = "DELETE FROM organization WHERE abbreviation='"+abbreviation+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_organization.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_program", methods=["GET", "POST"])
def delete_program():
    rs = connection.cursor()
    program_name = str(request.form.get('program_name'))
    if(program_name == "None" or program_name == ""):
        return render_template('delete_program.html')

    select = "SELECT program_id FROM program WHERE program_name='"+program_name+"';"
    rs.execute(select)
    program_id = rs.fetchall()

    if (len(program_id) > 1):
        return "There seems to be more than one program with the title you specified, please contant database administrators"
    if (len(program_id) <  1):
        return "There is not a program with the name you specified, please contact database administrators"

    delete = "DELETE FROM program WHERE program_id="+str(program_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_program.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/delete/delete_executive", methods=["GET", "POST"])
def delete_executive():
    rs = connection.cursor()

    executiveName = str(request.form.get('exec_name'))
    executiveSurname = str(request.form.get('exec_surname'))

    if(executiveName == "None" or executiveSurname == ""):
        return render_template('delete_executive.html')
    if(executiveName == "" or executiveSurname == ""):
        return render_template('delete_executive.html')

    select = "SELECT executive_id FROM executive WHERE name='"+executiveName+"' AND surname='"+executiveSurname+"';"
    rs.execute(select)
    executive_id = rs.fetchall()
    if (len(executive_id) > 1):
        return "There seems to be more than one executive with the name you specified, please contant database administrators"
    if (len(executive_id) <  1):
        return "There is not a executive with the name you specified, please contact database administrators"

    delete = "DELETE FROM executive WHERE executive_id="+str(executive_id[0][0])+";"
    try:
        rs.execute(delete)
    except:
        return "This executive manages a project so he/her can not be removed. To remove him/her, please remove the project/s, he/she manages, first."
    connection.commit()
    return render_template('delete_executive.html')

#update (some of the following may not be needed)
@app.route("/update/update_employee_relation")
def update_employee_relation():
    return render_template('update_employee_relation.html')

@app.route("/update/update_project")
def update_project():
    return render_template('update_project.html')

@app.route("/update/update_delivered")
def update_delivered():
    return render_template('update_delivered.html')

@app.route("/update/update_evaluate_project")
def update_evaluate_project():
    return render_template('update_evaluate_project.html')

@app.route("/update/update_researcher")
def update_researcher():
    return render_template('update_researcher.html')

@app.route("/update/update_organization", methods=["GET", "POST"]  )
def update_organization():
    return render_template('update_organization.html')

@app.route("/update/update_program", methods=["GET", "POST"])
def update_program():
        return render_template('update_program.html')

@app.route("/update/update_executive", methods=["GET", "POST"])
def update_executive():
        return render_template('update_executive.html')
