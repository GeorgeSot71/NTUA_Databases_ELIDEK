from flask import Flask, render_template, request
import mysql.connector, re

app = Flask(__name__)

connection = mysql.connector.connect(host='localhost',database='elidek',
user='root',password='rootroot')

#global variables
available_ids = [] #for query1

@app.route("/")
def main():
    return render_template('about.html')

@app.route("/read", methods=["GET", "POST"])
def read():

    table_name = str(request.form.get('type'))
    if(table_name == "" or table_name == "None"):
        return render_template('read.html')

    if(table_name == "researcher"):
        rs = connection.cursor()
        query = "SELECT * FROM researcher;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_researcher.html", table = results)
    elif(table_name == "organization_info"):
        rs = connection.cursor()
        query = "SELECT * FROM organization_info;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_organization_info.html", table = results)
    elif(table_name == "project"):
        rs = connection.cursor()
        query = "SELECT * FROM project;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_project.html", table = results)
    elif(table_name == "delivered"):
        rs = connection.cursor()
        query = "SELECT * FROM delivered;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_delivered.html", table = results)
    elif(table_name == "executive"):
        rs = connection.cursor()
        query = "SELECT * FROM executive;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_executive.html", table = results)
    elif(table_name == "program"):
        rs = connection.cursor()
        query = "SELECT * FROM program;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_program.html", table = results)
    elif(table_name == "employee_relation"):
        rs = connection.cursor()
        query = "SELECT * FROM employee_relation;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_employee_relation.html", table = results)
    elif(table_name == "scientific_field"):
        rs = connection.cursor()
        query = "SELECT * FROM scientific_field;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_scientific_field.html", table = results)
    elif(table_name == "works_on_project"):
        rs = connection.cursor()
        query = "SELECT * FROM works_on_project;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_works_on_project.html", table = results)
    elif(table_name == "evaluate_project"):
        rs = connection.cursor()
        query = "SELECT * FROM evaluate_project;"
        rs.execute(query)
        results = rs.fetchall()
        return render_template("read_evaluate_project.html", table = results)


    return render_template('read.html')

@app.route("/read_researcher", methods=["GET", "POST"])
def read_researcher():
    return render_template("read_researcher.html", table = results)

@app.route("/read_organization_info", methods=["GET", "POST"])
def read_organization_info():
    return render_template("read_researcher.html", table = results)

@app.route("/read_project", methods=["GET", "POST"])
def read_project():
    return render_template("read_researcher.html", table = results)

@app.route("/read_delivered", methods=["GET", "POST"])
def read_delivered():
    return render_template("read_researcher.html", table = results)

@app.route("/read_executive", methods=["GET", "POST"])
def read_executive():
    return render_template("read_researcher.html", table = results)

@app.route("/read_program", methods=["GET", "POST"])
def read_program():
    return render_template("read_researcher.html", table = results)

@app.route("/read_employee_relation", methods=["GET", "POST"])
def read_employee_relation():
    return render_template("read_researcher.html", table = results)

@app.route("/read_scientific_field", methods=["GET", "POST"])
def read_scientific_field():
    return render_template("read_researcher.html", table = results)

@app.route("/read_works_on_project", methods=["GET", "POST"])
def read_works_on_project():
    return render_template("read_researcher.html", table = results)

@app.route("/read_evaluate_project", methods=["GET", "POST"])
def read_evaluate_project():
    return render_template("read_researcher.html", table = results)


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

#queries
@app.route("/queries/query1")
def query1():
    return render_template('query1.html')

@app.route("/queries/query1_result", methods=["GET", "POST"])
def query1_result():
    global available_ids
    rs = connection.cursor()

    startDate = str(request.form.get('start_date'))
    dur = str(request.form.get('duration'))
    executiveName = str(request.form.get('executive_name'))
    executiveSurname = str(request.form.get('executive_surname'))

    if(startDate == "None" or dur == "None" or executiveName == "None" or executiveSurname == "None"):
        return render_template('query1_result.html')

    if(executiveName !="" and executiveSurname!=""):
   #executive_fullname -> executive_id
        select1 = "SELECT executive_id FROM executive WHERE name ='"+executiveName+"' AND surname='"+executiveSurname+"';"
        rs.execute(select1)
        executiveID = rs.fetchall()
        if (len(executiveID) >1):
            return "There seems to be more than one executive with the fullname you specified, please contant database administrators"
        if (len(executiveID) <  1):
            return "There is not an executive with the fullname you specified, please contact database administrators"

            executive_id = (
            " AND p.executive_id = {}".format(executiveID)
            if (executiveID != "")
            else ""
            )
    else:
        executive_id = " AND 1"



    start_date = (
        " AND MONTH(p.start_date) = MONTH('{0}') AND YEAR(p.start_date) = YEAR('{0}')".format(startDate)
        if (startDate != "")
        else ""
    )

    duration = (
        " AND YEAR(p.end_date)- YEAR(p.start_date) ={0}".format(dur)
        if (dur != "")
        else ""
    )

    my_query1_1 = "SELECT  * FROM program;"
    everything = " SELECT p.project_id, p.title, p.start_date, p.end_date, ex.name, ex.surname, ex.executive_id FROM project p, executive ex WHERE ex.executive_id=p.executive_id "
    my_query1_2 = (
        everything
        + start_date
        + duration
        + executive_id
        + " ORDER BY p.project_id ASC;"
    )

    rs.execute(my_query1_1)
    result1 = rs.fetchall()
    #tsekare mono to my_query1_2 gia arxh kai an doulevei
    #tha doume pos tha to kanoume kai gia ta dio
    rs.execute(my_query1_2)
    result2 = rs.fetchall()
    available_ids = []
    for i in range(len(result2)):
        available_ids.append(int(result2[i][0]))

    return render_template('query1_result.html', query1_1 = result1,query1_2 = result2)

@app.route("/queries/query1_result2", methods=["GET", "POST"])
def query1_result2():
    global available_ids
    rs = connection.cursor()
    #return str(available_ids)
    project_id = str(request.form.get('project_id'))
    if(project_id == ""):
        return "Please specify a project_id."
    if(int(project_id) not in available_ids):
        return "The project_id you specified was not in the list of available IDs."

    select_query2 = "SELECT p.title FROM project p WHERE project_id="+project_id+";"
    project_title_ret = rs.execute(select_query2)
    ret_title = rs.fetchall()
    ret_title = ret_title[0][0]

    select_query = "SELECT r.name, r.surname FROM researcher r WHERE r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = "+project_id+") "
    project_title_ret = rs.execute(select_query)
    researchers = rs.fetchall()

    return render_template("query1_resul2.html", title = ret_title, table = researchers)

@app.route("/queries/query2a", methods=["GET", "POST"])
def query2a():
    rs = connection.cursor()
    select1 = "SELECT * FROM projects_per_researcher;"
    rs.execute(select1)
    projects_per_researcher = rs.fetchall()
    return render_template('query2a.html', query2a = projects_per_researcher)

@app.route("/queries/query2b", methods=["GET", "POST"])
def query2b():
    rs = connection.cursor()
    select1 = "SELECT * FROM organization_info;"
    rs.execute(select1)
    organization_info = rs.fetchall()
    return render_template('query2b.html', query2b = organization_info)

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

    everything = " SELECT sf.scientific_field_name, p.title, r.name, r.surname FROM scientific_field sf, researcher r, project p WHERE p.project_id = sf.project_id "
    my_query3 = (everything+scientific_field+"AND YEAR(p.end_date) >= YEAR('2022-06-10') AND MONTH(p.end_date) > MONTH('2022-06-10') AND r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = p.project_id);")

    rs.execute(my_query3)
    result3 = rs.fetchall()
    return render_template('query3_result.html', query3 = result3)

@app.route("/queries/query4")
def query4():
    rs = connection.cursor()
    query = "SELECT COUNT(DISTINCT(p1.project_id)),  COUNT(DISTINCT(p2.project_id)), organ.abbreviation, organ.name, YEAR(p1.start_date), YEAR(p2.start_date) FROM project p1 INNER JOIN organization organ ON  p1.abbreviation = organ.abbreviation INNER JOIN project p2 ON  p2.abbreviation = organ.abbreviation AND (YEAR(p1.start_date) - YEAR(p2.start_date)) = 1 GROUP BY p1.abbreviation, YEAR(p1.start_date), YEAR(p2.start_date) HAVING COUNT(DISTINCT(p1.project_id)) =  COUNT(DISTINCT(p2.project_id)) AND COUNT(DISTINCT(p1.project_id)) >= 10;"
    rs.execute(query)
    returned_values = rs.fetchall()
    return render_template('query4.html', query4 = returned_values)

@app.route("/queries/query5", methods=["GET", "POST"])
def query5():
    rs = connection.cursor()
    query = "SELECT scf1.scientific_field_name, scf2.scientific_field_name,SUM(p.funding) FROM project p, scientific_field scf1, scientific_field scf2 WHERE scf1.project_id =scf2.project_id AND scf1.scientific_field_name > scf2.scientific_field_name AND p.project_id = scf1.project_id GROUP BY scf1.scientific_field_name,  scf2.scientific_field_name ORDER BY SUM(p.funding) DESC , scf1.scientific_field_name, scf2.scientific_field_name LIMIT 3;"
    rs.execute(query)
    results = rs.fetchall()
    return render_template('query5.html', query5 = results)

@app.route("/queries/query6")
def query6():
    rs = connection.cursor()
    query = "SELECT r.name,r.surname, r.birthday,COUNT(wop.researcher_id) FROM researcher r, works_on_project wop WHERE r.researcher_id = wop.researcher_id AND YEAR(r.birthday) > YEAR('1982-06-10') GROUP BY r.researcher_id ORDER BY COUNT(wop.researcher_id) DESC;"
    rs.execute(query)
    returned_values = rs.fetchall()
    return render_template('query6.html', query6 = returned_values)

@app.route("/queries/query7", methods=["GET", "POST"])
def query7():
    rs = connection.cursor()
    query = "SELECT ex.name, ex.surname, org.name, SUM(p.funding) FROM executive ex, organization org, project p WHERE  ex.executive_id = p.executive_id AND org.abbreviation = p.abbreviation AND org.abbreviation IN (SELECT abbreviation FROM company) GROUP BY ex.name, ex.surname, org.name ORDER BY SUM(p.funding) DESC LIMIT 5;"
    rs.execute(query)
    results = rs.fetchall()
    return render_template('query7.html', query7 = results)

@app.route("/queries/query8", methods=["GET", "POST"])
def query8():
    rs = connection.cursor()
    query = "SELECT r.name, r.surname, COUNT(wop.researcher_id) FROM researcher r, works_on_project wop WHERE r.researcher_id = wop.researcher_id AND wop.project_id NOT IN (SELECT project_id FROM delivered) GROUP BY r.researcher_id HAVING COUNT(wop.researcher_id) >= 5"
    rs.execute(query)
    results = rs.fetchall()
    return render_template('query8.html', query8 = results)

#insert
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
    #insert into employee relation
    insert2 = "INSERT INTO `employee_relation`(`researcher_id`, `abbreviation`, `start_working_date`) VALUES ("+str(inspector_results[0][0])+", '"+org_abr+"', '"+start_date+"');"
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
    try:
        rs.execute(insert4)
    except mysql.connector.errors.IntegrityError as e:
        return e

    connection.commit()

    return render_template('insert_project.html')

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


#delete
@app.route("/delete/delete_employee_relation", methods=["GET", "POST"])
def delete_employee_relation():
    rs = connection.cursor()

    abbreviation = str(request.form.get('abbreviation'))
    researcherName = str(request.form.get('name'))
    researcherSurname = str(request.form.get('surname'))

    if(abbreviation == "None" or abbreviation == ""):
        return render_template('delete_employee_relation.html')
    if(researcherName == "" or researcherName == "None"):
        return render_template('delete_employee_relation.html')
    if(researcherSurname == "" or researcherSurname == "None"):
        return render_template('delete_employee_relation.html')

    select = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select)
    researcher_id = rs.fetchall()

    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified"

    delete = "DELETE FROM employee_relation WHERE abbreviation='"+abbreviation+"' AND researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_employee_relation.html')

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
        return "There is not a project with the name you specified"

    delete = "DELETE FROM project WHERE project_id='"+str(project_id[0][0])+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_project.html')

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
        return "There is not a project with the name you specified"

    delete = "DELETE FROM delivered WHERE title='"+delivered_title+"' AND project_id='"+str(project_id[0][0])+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_delivered.html')

@app.route("/delete/delete_works_on_project", methods=["GET", "POST"])
def delete_works_on_project():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))

    if(project_title == "None" or project_title == ""):
        return render_template('delete_works_on_project.html')
    if(researcherName == "None" or researcherName == ""):
        return render_template('delete_works_on_project.html')
    if(researcherSurname == "None" or researcherSurname == ""):
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
        return "There is not a project with the name you specified"
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified"

    delete = "DELETE FROM works_on_project WHERE project_id="+str(project_id[0][0])+" AND researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_works_on_project.html')

@app.route("/delete/delete_evaluate_project", methods=["GET", "POST"])
def delete_evaluate_project():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))

    if(project_title == "None" or project_title == ""):
        return render_template('delete_evaluate_project.html')
    if(researcherName == "None" or researcherName == ""):
        return render_template('delete_evaluate_project.html')
    if(researcherSurname == "None" or researcherSurname == ""):
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
        return "There is not a project with the name you specified"
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified"

    delete = "DELETE FROM evaluate_project WHERE project_id="+str(project_id[0][0])+" AND researcher_id="+str(researcher_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_evaluate_project.html')

@app.route("/delete/delete_scientific_field", methods=["GET", "POST"])
def delete_scientific_field():
    rs = connection.cursor()

    project_title = str(request.form.get('title'))
    scientific_field = str(request.form.get('type'))

    if(scientific_field == "None" or scientific_field == ""):
        return render_template('delete_scientific_field.html')
    if(project_title == "None" or project_title == ""):
        return render_template('delete_scientific_field.html')

    select = "SELECT project_id FROM project WHERE title='"+project_title+"';"
    rs.execute(select)
    project_id = rs.fetchall()

    if (len(project_id) >1):
        return "There seems to be more than one projects with the name you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified"

    delete = "DELETE FROM scientific_field WHERE project_id="+str(project_id[0][0])+" AND scientific_field_name='"+scientific_field+"';"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_scientific_field.html')

@app.route("/delete/delete_researcher", methods=["GET", "POST"])
def delete_researcher():
    rs = connection.cursor()

    researcherName = str(request.form.get('name'))
    researcherSurname = str(request.form.get('surname'))

    if(researcherName == "None" or researcherSurname == ""):
        return render_template('delete_researcher.html')
    if(researcherName == "None" or researcherSurname == ""):
        return render_template('delete_researcher.html')

    select = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified"

    delete = "DELETE FROM researcher WHERE researcher_id="+str(researcher_id[0][0])+";"
    try:
        rs.execute(delete)
    except:
        return "It seems like this researcher is a scientific inspector or evaluator to some project, and thus cannot be deleted"
    connection.commit()
    return render_template('delete_researcher.html')

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
        return "There is not a program with the name you specified"

    delete = "DELETE FROM program WHERE program_id="+str(program_id[0][0])+";"
    rs.execute(delete)
    connection.commit()
    return render_template('delete_program.html')

@app.route("/delete/delete_executive", methods=["GET", "POST"])
def delete_executive():
    rs = connection.cursor()

    executiveName = str(request.form.get('exec_name'))
    executiveSurname = str(request.form.get('exec_surname'))

    if(executiveName == "None" or executiveSurname == ""):
        return render_template('delete_executive.html')
    if(executiveName == "None" or executiveSurname == ""):
        return render_template('delete_executive.html')

    select = "SELECT executive_id FROM executive WHERE name='"+executiveName+"' AND surname='"+executiveSurname+"';"
    rs.execute(select)
    executive_id = rs.fetchall()
    if (len(executive_id) > 1):
        return "There seems to be more than one executive with the name you specified, please contant database administrators"
    if (len(executive_id) <  1):
        return "There is not a executive with the name you specified"

    delete = "DELETE FROM executive WHERE executive_id="+str(executive_id[0][0])+";"
    try:
        rs.execute(delete)
    except:
        return "This executive manages a project so he/her can not be removed. To remove him/her, please remove the project/s, he/she manages, first."
    connection.commit()
    return render_template('delete_executive.html')

#update (some of the following may not be needed)

@app.route("/update/update_employee_relation", methods=["GET", "POST"])
def update_employee_relation():
    rs = connection.cursor()
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))
    orgAbbr = str(request.form.get('abbreviation'))
    startWorkingDate = str(request.form.get('start_working_date'))

    if(orgAbbr == "None" or researcherName == "None" or researcherSurname == "None"):
        return render_template('update_employee_relation.html')
    if(orgAbbr == "" or researcherName == "" or researcherSurname == ""):
        return render_template('update_employee_relation.html')

    if(startWorkingDate == ""):
        return render_template('update_employee_relation.html')

    
    #researcher_fullname -> researcher_id
    select1 = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select1)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"


    start_working_date = (
        "start_working_date = '{}'".format(startWorkingDate)
        if (startWorkingDate!= "")
        else ""
    )

    
    queryUpdate = "UPDATE `employee_relation` SET "+evaluation_date+" WHERE abbreviation ="+orgAbbr+" AND researcher_id ="+str(researcher_id[0][0])+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "<h1>This organization abbreviation does not exist, go back and input an existing abbreviation</h1>"
    return render_template('update_employee_relation.html')

@app.route("/update/update_project")
def update_project():
    return render_template('update_project.html')

@app.route("/update/update_delivered")
def update_delivered():
    rs = connecion.cursor()

    project_title = str(request.form.get('title1'))
    del_title = str(request.form.get('title2'))
    delivery_date = str(request.form.get('delivery_date'))
    summary = str(request.form.get('summary'))

    if(project_title == "None" and del_title == "None" and delivery_date == "None" and summary == "None"):
        return render_template('update_delivered.html')

    if(project_title == "" or del_title == "" or (delivery_date == "" and summary == "")):
        return render_template('update_delivered.html')


    select1 = "SLEECT p.project_id FROM project p WHERE  p.title = '"+project_title+"';"
    rs.execute(select1)
    select_result = rs.fetchall()

    if(len(select_result) > 1):
        return "There are more than 1 projects with the same title"
    if(len(select_result) < 1):
        return "There is no project with the specified title"


    update = "UPDATE delivered SET "


    return render_template('update_delivered.html')


@app.route("/update/update_evaluate_project", methods=["GET", "POST"])
def update_evaluate_project():
    rs = connection.cursor()
    projectTitle = str(request.form.get('project_title'))
    researcherName = str(request.form.get('researcher_name'))
    researcherSurname = str(request.form.get('researcher_surname'))
    evalDate = str(request.form.get('evaluation_date'))
    evalGrade = str(request.form.get('grade'))

    if(projectTitle == "None" or researcherName == "None" or researcherSurname == "None"):
        return render_template('update_evaluate_project.html')
    if(projectTitle == "" or researcherName == "" or researcherSurname == ""):
        return render_template('update_evaluate_project.html')

    if(evalDate == "" and evalGrade == ""):
        return render_template('update_evaluate_project.html')

    #projectTitle -> project_id
    select1 = "SELECT project_id FROM project WHERE title='"+projectTitle+"';"
    rs.execute(select1)
    project_id = rs.fetchall()
    if (len(project_id) >1):
        return "There seems to be more than one projects with the name you specified, please contant database administrators"
    if (len(project_id) <  1):
        return "There is not a project with the name you specified, please contact database administrators"

    #researcher_fullname -> researcher_id
    select2 = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select2)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    evaluation_date = (
        "evaluation_date = '{}'".format(evalDate)
        if (evalDate!= "")
        else ""
    )

    if(evalDate != ""):
        evaluation_grade = (
            ", grade = '{}'".format(evalGrade)
            if (evalGrade != "")
            else ""
        )
    else:
        evaluation_grade = (
            "grade = '{}'".format(evalGrade)
            if (evalGrade != "")
            else ""
        )
    queryUpdate = "UPDATE `evaluate_project` SET "+evaluation_date+" "+evaluation_grade+" WHERE project_id ="+str(project_id[0][0])+" AND researcher_id ="+str(researcher_id[0][0])+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError as e:
        return e
    return render_template('update_evaluate_project.html')

#DONE
@app.route("/update/update_researcher", methods=["GET", "POST"])
def update_researcher():
    rs = connection.cursor()
    researcherName = str(request.form.get('name'))
    researcherSurname = str(request.form.get('surname'))
    birthDate = str(request.form.get('birthday'))
    researcherGender = str(request.form.get('sex'))

    if(researcherName == "None" or researcherSurname == "None"):
        return render_template('update_researcher.html')
    if(researcherName == "" or researcherSurname == ""):
        return render_template('update_researcher.html')

    if(birthDate == "" and researcherGender == ""):
        return render_template('update_researcher.html')

    #researcher_fullname -> researcher_id
    select1 = "SELECT researcher_id FROM researcher WHERE name='"+researcherName+"' AND surname='"+researcherSurname+"';"
    rs.execute(select1)
    researcher_id = rs.fetchall()
    if (len(researcher_id) >1):
        return "There seems to be more than one researchers with the name you specified, please contant database administrators"
    if (len(researcher_id) <  1):
        return "There is not a researcher with the name you specified, please contact database administrators"

    birth_date = (
        "birthday = '{}'".format(birthDate)
        if (birthDate!= "")
        else ""
    )

    if(birthDate != ""):
        gender = (
            ", sex = '{}'".format(researcherGender)
            if (researcherGender != "")
            else ""
        )
    else:
        gender = (
            "sex = '{}'".format(researcherGender)
            if (researcherGender != "")
            else ""
        )
    queryUpdate = "UPDATE `researcher` SET "+birth_date+" "+gender+" WHERE researcher_id ="+str(researcher_id[0][0])+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError as e:
        return e
    return render_template('update_researcher.html')


@app.route("/update/update_organization", methods=["GET", "POST"])
def update_organization():
    rs = connection.cursor()
    orgAbbr = str(request.form.get('abbreviation'))
    orgName = str(request.form.get('name'))
    orgPC = str(request.form.get('postcode'))
    orgAddress = str(request.form.get('address'))
    orgCity = str(request.form.get('town'))

    if(orgAbbr == "None"):
        return render_template('update_organization.html')
    if(orgAbbr == ""):
        return render_template('update_organization.html')

    if(orgName == "" and orgPC== "" and orgAddress== "" and orgCity== ""):
        return render_template('update_organization.html')

    #abbreviation
    select = "SELECT name FROM organization WHERE abbreviation='"+orgAbbr+"';"
    rs.execute(select)
    number_org = rs.fetchall()
    if (len(number_org) <  1):
        return "There is not an organization with the abbreviation you specified, please contact database administrators"

    #name =================
    org_name = (
        "name = '{}'".format(orgName)
        if (orgName!= "")
        else ""
    )
    #postcode ==============
    if(org_name != ""):
        org_postcode = (
            ", post_code = {}".format(orgPC)
            if (orgPC != "")
            else ""
        )
    else:
        org_postcode = (
            "post_code = '{}'".format(orgPC)
            if (orgPC != "")
            else ""
        )
    #road =================
    if(org_name != "" or org_postcode !=""):
        org_address = (
            ", road = '{}'".format(orgAddress)
            if (orgAddress != "")
            else ""
        )
    else:
        org_address = (
            "road = '{}'".format(orgAddress)
            if (orgAddress != "")
            else ""
        )

    #town ==================
    if(org_name != "" or org_postcode !="" or org_address !=""):
        org_town = (
            ", town = '{}'".format(orgCity)
            if (orgCity != "")
            else ""
        )
    else:
        org_town = (
            "town = '{}'".format(orgCity)
            if (orgCity != "")
            else ""
        )


    queryUpdate = "UPDATE `organization` SET "+org_name+" "+str(org_postcode)+" "+org_road+" "+org_town+" WHERE researcher_id ="+orgAbbr+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError as e:
        return e
    return render_template('update_organization.html')

@app.route("/update/update_program", methods=["GET", "POST"])
def update_program():
    rs = connection.cursor()
    OldProgramName = str(request.form.get('old_program_name'))
    NewProgramName = str(request.form.get('new_program_name'))
    programAddress = str(request.form.get('program_address'))

    if(OldProgramName == "None"):
        return render_template('update_program.html')
    if(OldProgramName == ""):
        return render_template('update_program.html')

    if(NewProgramName == "" and programAddress == ""):
        return render_template('update_program.html')

    #old_program_name -> program_id
    select = "SELECT program_id FROM program WHERE program_name='"+OldProgramName+"';"
    rs.execute(select)
    program_id = rs.fetchall()
    if (len(program_id) >1):
        return "There seems to be more than one programs with the name you specified, please contant database administrators"
    if (len(program_id) <  1):
        return "There is not a program with the name you specified, please contact database administrators"

    new_program_name = (
        "program_name = '{}'".format(NewProgramName)
        if (NewProgramName!= "")
        else ""
    )

    if(new_program_name != ""):
        program_address = (
            ", address = '{}'".format(programAddress)
            if (programAddress != "")
            else ""
        )
    else:
        program_address = (
            "address = '{}'".format(programAddress)
            if (programAddress != "")
            else ""
        )
    queryUpdate = "UPDATE `program` SET "+new_program_name+" "+program_address+" WHERE program_id ="+str(program_id[0][0])+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError as e:
        return e
    return render_template('update_program.html')


@app.route("/update/update_executive", methods=["GET", "POST"])
def update_executive():
    rs = connection.cursor()
    executiveName = str(request.form.get('exec_name'))
    executiveSurname = str(request.form.get('exec_surname'))
    birthDate = str(request.form.get('exec_birthday'))
    executiveGender = str(request.form.get('exec_sex'))

    if(executiveName == "None" or executiveSurname == "None"):
        return render_template('update_executive.html')
    if(executiveName == "" or executiveSurname == ""):
        return render_template('update_executive.html')

    if(birthDate == "" and executiveGender == ""):
        return render_template('update_executive.html')

    #executive_fullname -> executive_id
    select = "SELECT executive_id FROM executive WHERE name='"+executiveName+"' AND surname='"+executiveSurname+"';"
    rs.execute(select)
    executive_id = rs.fetchall()
    if (len(executive_id) >1):
        return "There seems to be more than one executives with the name you specified, please contant database administrators"
    if (len(executive_id) <  1):
        return "There is not an executive with the name you specified, please contact database administrators"

    birth_date = (
        "birthday = '{}'".format(birthDate)
        if (birthDate!= "")
        else ""
    )

    if(birthDate != ""):
        gender = (
            ", sex = '{}'".format(executiveGender)
            if (executiveGender != "")
            else ""
        )
    else:
        gender = (
            "sex = '{}'".format(executiveGender)
            if (executiveGender != "")
            else ""
        )
    queryUpdate = "UPDATE `executive` SET "+birth_date+" "+gender+" WHERE executive_id ="+str(executive_id[0][0])+";"
    #return queryUpdate
    try:
        rs.execute(queryUpdate)
        connection.commit()
    except mysql.connector.errors.IntegrityError as e:
        return e
    return render_template('update_executive.html')
