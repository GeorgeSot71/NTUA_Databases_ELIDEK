from flask import Flask, render_template, request
import mysql.connector, re
from datetime import datetime

app = Flask(__name__)

connection = mysql.connector.connect(host='localhost',database='elidek',
user='root',password='rootroot')

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

@app.route("/queries/query1")
def query1():
    return render_template('query1.html')

@app.route("/queries/query2")
def query2():
    return render_template('query2.html')

@app.route("/queries/query3a")
def query3a():
    return render_template('query3a.html')

@app.route("/queries/query3b")
def query3b():
    return render_template('query3b.html')

@app.route("/queries/query4")
def query4():
    return render_template('query4.html')

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

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_program", methods=["GET", "POST"])
def insert_program():
    rs = connection.cursor()
    program_name = str(request.form.get('program_name'))
    program_address = str(request.form.get('program_address'))
    if(program_name == "None" or program_address == "None"):
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
    if(exec_name == "None" or exec_surname == "None" or exec_sex == 'None' or birthday == ''):
        return render_template('insert_executive.html')
    queryString = "INSERT INTO `executive` (`name`, `surname`, `birthday`, `sex`) VALUES ('"+exec_name+"', '"+exec_surname+"', '"+birthday+"', '"+exec_sex+"');"
    rs.execute(queryString)
    connection.commit()

    return render_template('insert_executive.html')
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
    if(org_type == "scientific_center" and org_budget2 == ""):
        return "Missing Value: Please go back and specify the amount of private funds!"
    queryString1 = "INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('"+org_abr+"', '"+org_name+"', "+org_postcode+", '"+org_address+"', '"+org_town+"');"
    rs.execute(queryString1)
    #query2String = ""
    #rs.execute(queryString2)
    connection.commit()

    return render_template('insert_organization.html')

#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE
@app.route("/insert/insert_phone", methods=["GET", "POST"])
def insert_phone():
    rs = connection.cursor()
    org_abr = str(request.form.get('abbreviation'))
    phone = str(request.form.get('phone'))
    if(org_abr == "None" or phone == "None"):
        return render_template('insert_phone.html')
    queryString = "INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('"+org_abr+"', '"+phone+"');"
    try:
        rs.execute(queryString)
        connection.commit()
    except mysql.connector.errors.IntegrityError:
        return "<h1>This organization abbreviation does not exist, go back and input an existing abbreviation</h1>"
    return render_template('insert_phone.html')
#DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE #DONE

@app.route("/insert/insert_employee_relation")
def insert_employee_relation():
    return render_template('insert_employee_relation.html')

@app.route("/insert/insert_project")
def insert_project():
    return render_template('insert_project.html')

@app.route("/insert/insert_delivered")
def insert_delivered():
    return render_template('insert_delivered.html')

@app.route("/insert/insert_works_on_project")
def insert_works_on_project():
    return render_template('insert_works_on_project.html')

@app.route("/insert/insert_evaluate_project")
def insert_evaluate_project():
    return render_template('insert_evaluate_project.html')

@app.route("/insert/insert_scientific_field")
def insert_scientific_field():
    return render_template('insert_scientific_field.html')

@app.route("/insert/insert_researcher")
def insert_researcher():
    return render_template('insert_researcher.html')

# George added the following just to render the websites

#delete
@app.route("/delete/delete_employee_relation")
def delete_employee_relation():
    return render_template('delete_employee_relation.html')
    
@app.route("/delete/delete_project")
def delete_project():
    return render_template('delete_project.html')

@app.route("/delete/delete_delivered")
def delete_delivered():
    return render_template('delete_delivered.html')

@app.route("/delete/delete_works_on_project")
def delete_works_on_project():
    return render_template('delete_works_on_project.html')

@app.route("/delete/delete_evaluate_project")
def delete_evaluate_project():
    return render_template('delete_evaluate_project.html')

@app.route("/delete/delete_scientific_field")
def delete_scientific_field():
    return render_template('delete_scientific_field.html')

@app.route("/delete/delete_researcher")
def delete_researcher():
    return render_template('delete_researcher.html')

@app.route("/delete/delete_phone", methods=["GET", "POST"])
def delete_phone():
    return render_template('delete_phone.html')

@app.route("/delete/delete_organization", methods=["GET", "POST"]  )
def delete_organization():
    return render_template('delete_organization.html')

@app.route("/delete/delete_program", methods=["GET", "POST"])
def delete_program():
        return render_template('delete_program.html')    

@app.route("/delete/delete_executive", methods=["GET", "POST"])
def delete_executive():
        return render_template('delete_executive.html')

    
#update
@app.route("/update/update_employee_relation")
def update_employee_relation():
    return render_template('update_employee_relation.html')
    
@app.route("/update/update_project")
def update_project():
    return render_template('update_project.html')

@app.route("/update/update_delivered")
def update_delivered():
    return render_template('update_delivered.html')

@app.route("/update/update_works_on_project")
def update_works_on_project():
    return render_template('update_works_on_project.html')

@app.route("/update/update_evaluate_project")
def update_evaluate_project():
    return render_template('update_evaluate_project.html')

@app.route("/update/update_scientific_field")
def update_scientific_field():
    return render_template('update_scientific_field.html')

@app.route("/update/update_researcher")
def update_researcher():
    return render_template('update_researcher.html')

@app.route("/update/update_phone", methods=["GET", "POST"])
def update_phone():
    return render_template('update_phone.html')

@app.route("/update/update_organization", methods=["GET", "POST"]  )
def update_organization():
    return render_template('update_organization.html')

@app.route("/update/update_program", methods=["GET", "POST"])
def update_program():
        return render_template('update_program.html')    

@app.route("/update/update_executive", methods=["GET", "POST"])
def update_executive():
        return render_template('update_executive.html')
