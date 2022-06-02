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

@app.route("/insert/insert_executive")
def insert_executive():
    return render_template('insert_executive.html')

@app.route("/insert/insert_researcher")
def insert_researcher():
    return render_template('insert_researcher.html')

@app.route("/insert/insert_organization")
def insert_organization():
    return render_template('insert_organization.html')

@app.route("/insert/insert_phone")
def insert_phone():
    return render_template('insert_phone.html')

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
