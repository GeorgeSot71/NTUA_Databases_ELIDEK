@app.route("/queries/query1", methods=["GET", "POST"])
def query1():
    rs = connection.cursor()
    projectID = str(request.form.get('project_id'))
    startDate = str(request.form.get('start_date'))
    dur = str(request.form.get('duration'))
    executiveID = str(request.form.get('executive_id'))
    researcherID = str(request.form.get('researcher_id'))
   
    project_id = (
        " AND p.project_id = {}".format(projectID)
        if (projectID != "")
        else ""
    )
    start_date = (
        " AND MONTH(p.start_date) = MONTH('{0}') AND YEAR(p.start_date) = YEAR('{0}')".format(startDate)
        if (startDate != "")
        else "" 
    )
    
    duration = (
        " AND YEAR(p.end_date)- YEAR(p.start_date) ={}".format(dur)
        if (dur != " " )
        else ""
    )

    executive_id = (
        " and p.executive_id = {}".format(executiveID)
        if (executiveID != "")
        else ""
    )
    researcher_id = (
        " and r.researcher_id IN (SELECT researcher_id FROM works_on_project WHERE project_id = {})".format(researcherID)
        if (researcherID != "")
        else ""
    )
    
my_query1_1 = "SELECT  * FROM program;"   
everything = " SELECT r.researcher_id,r.name,r.surname, p.project_id FROM researcher r, project p WHERE "
my_query1_2 = (
    everything
    + project_id
    + start_date
    + duration
    + executive_id
    + researcher_id
    + "limit 10"
)

print(my_query1_1 + "\n" + my_query1_2)

#cur.execute(my_query1_1)
#result1 = cur.fetchall()
#tsekare mono to my_query1_2 gia arxh kai an doulevei 
#tha doume pos tha to kanoume kai gia ta dio
cur.execute(my_query1_2)
result2 = cur.fetchall()
return render_template('query1.html', data = result2)
