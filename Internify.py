from flask import Flask, render_template,request,redirect, url_for,session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

app = Flask(__name__)
app.secret_key = 'xyz'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'internify'
mysql = MySQL(app)


@app.route('/')
def hello_world():
    return render_template('index2.html')

@app.route('/signuppage')
def signuppage():
    return render_template('Registration_student.html')

@app.route('/signup_page_company')
def signup_page_company():
    return render_template('Registration_company.html')

@app.route('/choiceS')
def choiceS():
    return render_template('choiceS.html')



@app.route('/login_page')
def login_page():
    return render_template('Login_student.html')

@app.route('/signup', methods=['POST'])
def signup():
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        FName = userDetails['FName']
        LName = userDetails['LName']
        Username = userDetails['Username']
        Phone = userDetails['Phone']
        email = userDetails['email']
        password = userDetails['psw']
        # Create cursor
        cur = mysql.connection.cursor()
        # Execute query
        cur.execute("INSERT INTO `signup`(`FirstName`, `LastName`, `UserName`, `PhoneNo`, `Email`, `Password`) VALUES (%s,%s,%s,%s,%s,%s)", (FName,LName,Username,Phone,email,password))
        # Commit to DB
        mysql.connection.commit()
        # Close connection
        cur.close()
        return render_template('more_details_stu.html',Username=Username)

@app.route('/Detail_stu', methods=['POST'])
def Detail_stu():
    userDetails = request.form
    Username = userDetails['Username']
    image = userDetails['image']
    Aboutme = userDetails['Aboutme']
    Resume = userDetails['Resume']
    Github = userDetails['Github']
    Linked_In = userDetails['Linked_In']
    leetcode = userDetails['leetcode']

    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO `details_stu`(`Username`, `image`, `Aboutme`, `Resume`, `Github`, `Linked_In`, `leetcode`) VALUES (%s,%s,%s,%s,%s,%s,%s)", (Username,image,Aboutme,Resume,Github,Linked_In,leetcode))
    # Commit to DB
    mysql.connection.commit()
    cur.close()
   
    return redirect(url_for('login_page'))


@app.route('/signupC', methods=['POST'])
def signupC():
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        CName = userDetails['CName']
        emailc = userDetails['email']
        passwordc = userDetails['psw']
        # Create cursor
        cur = mysql.connection.cursor()
        # Execute query
        cur.execute("INSERT INTO `signup_company`(`CName`, `Email`, `Password`) VALUES (%s,%s,%s)", (CName,emailc,passwordc))
        # Commit to DB
        mysql.connection.commit()
        # Close connection
        cur.close()
        return redirect(url_for('login_page_company'))


@app.route('/login_process', methods=['GET', 'POST'])
def login_process():
    if request.method == 'POST':
        username = request.form['un']
        password = request.form['psw']

        cur = mysql.connection.cursor()
        cur.execute("SELECT UserName FROM signup WHERE UserName = %s AND Password = %s", (username, password))
        x = cur.fetchone()

        cur.close()
        cur.close()
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()
        if x:
            session['UserName'] = x[0]
            return render_template('studentpage.html',x=x,data = data)
        else:
            return 'Invalid username/password'

    return render_template('Login_student.html')


@app.route('/back', methods=['GET', 'POST'])
def back():
    if request.method == 'POST':
        x = request.form.get('cname')

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()

    return render_template('studentpage02.html',x=x,data = data)

@app.route('/back2', methods=['GET', 'POST'])
def back2():
    if request.method == 'POST':
        x = request.form.get('cname')

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()

    return render_template('companypage02.html',x=x,data = data)


@app.route('/approved', methods=['GET', 'POST'])
def approved():
    if request.method == 'POST':
        x = request.form.get('stu_name')
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM accept where stu_name = %s",(x,))
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()
        
    return render_template('approved.html',x=x,data = data)

@app.route('/Explore', methods=['GET', 'POST'])
def Explore():
    if request.method == 'POST':
        x = request.form.get('stu_name')
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  
        cur.close()
        
    return render_template('studentpage02.html',x=x,data = data)
# @app.route('/Details', methods=['GET', 'POST'])
# def Details():
#     data_name = request.args.get('data_name')
#     cur = mysql.connection.cursor()
    
#     # Execute query
#     cur.execute("SELECT * FROM `internship` WHERE tital = %s", (data_name,))
    
#     # Fetch the data
#     data1 = cur.fetchone()
    
#     # Close the cursor
#     cur.close()
    
#     return render_template('your_template_name.html', data1=data1)

@app.route('/Apply', methods=['GET', 'POST'])
def Apply():
    if request.method == 'POST':
        x = request.form.get('stu_name')
        tital = request.form.get('tital')
        cname = request.form.get('cname')

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO `apply`(`stu_name`, `tital`, `c_name`) VALUES (%s,%s,%s)", (x,tital,cname))
        mysql.connection.commit()
        cur.close()
        
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()
    return render_template('studentpage02.html',x=x,data = data)


@app.route('/login_process_company', methods=['GET', 'POST'])
def login_process_company():
    if request.method == 'POST':
        username = request.form['un']
        password = request.form['psw']

        cur = mysql.connection.cursor()
        cur.execute("SELECT CName FROM signup_company WHERE CName = %s AND Password = %s", (username, password))
        x = cur.fetchone()

        cur.close()
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship")
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()

        if x:
            session['CName'] = x[0]
            return render_template('companypage.html',x=x,data = data)
        else:
            return 'Invalid username/password'

    return render_template('Login_company.html')
@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('/'))

@app.route('/internship_info')
def internship_info():
    return render_template('internship_info.html')

@app.route('/internship_info_insertion', methods=['POST'])
def internship_info_insertion():
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        CName = userDetails['CName']
        tital = userDetails['tital']
        sort_intro = userDetails['sort_intro']
        Skills = userDetails['Skills']
        Details = userDetails['Details']
        seats = userDetails['seats']
        About_company = userDetails['About_company']
        # Create cursor
        cur = mysql.connection.cursor()
        # Execute query
        cur.execute("INSERT INTO `internship`(`CName_int`, `tital`, `intro`, `techno`, `detail_info`, `seats`, `About_company`) VALUES (%s,%s,%s,%s,%s,%s,%s)", (CName,tital,sort_intro,Skills,Details,seats,About_company))
        # Commit to DB
        mysql.connection.commit()
        cur.execute("SELECT CName_int FROM internship WHERE tital = %s", (tital,))
        x = cur.fetchone()
        # Close connection
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM internship WHERE CName_int = %s",(x,))
        data = cur.fetchall()  # Fetch all rows from the result set
        cur.close()
        return render_template('companypage.html',x=x,data=data)

@app.route('/internship_secton', methods=['POST'])
def internship_secton():
    var1 = request.form.get('variable_name')
    x = request.form.get('Stu_Name')

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM internship")
    data = cur.fetchall()
     
    cur.execute("SELECT * FROM internship WHERE tital =%s",(var1,))
    data1 = cur.fetchall()
    cur.close()
    return render_template('student_internship_application.html',x=x,data=data,data1=data1)

@app.route('/Applications', methods=['POST'])
def Applications():
    var1 = request.form.get('variable_name')
    x = request.form.get('cname')

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM internship")
    data = cur.fetchall()
     
    cur.execute("SELECT * FROM apply WHERE tital =%s",(var1,))
    data1 = cur.fetchall()
    cur.close()
    return render_template('company_applicante.html',x=x,data=data,data1=data1,var1=var1)

@app.route('/View', methods=['POST'])
def View():
    var1 = request.form.get('stu_name')
    x = request.form.get('cname')
    tital = request.form.get('tital')

    cur = mysql.connection.cursor()
     
    cur.execute("SELECT * FROM details_stu WHERE Username =%s",(var1,))
    data1 = cur.fetchall()
    cur.close()

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM signup WHERE Username =%s",(var1,))
    data = cur.fetchall()
    cur.close()
    return render_template('profile.html',x=x,data1=data1,data=data,var1=var1,tital=tital)

@app.route('/accept', methods=['POST'])
def accept():
    stu_name = request.form.get('stu_name')
    x = request.form.get('cname')
    var1 = request.form.get('tital')

    cur = mysql.connection.cursor()
     
    cur.execute("INSERT INTO `accept`(`stu_name`, `tital`, `cname`) VALUES (%s,%s,%s)",(stu_name,var1,x))
    mysql.connection.commit()

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM internship")
    data = cur.fetchall()
     
    cur.execute("SELECT * FROM apply WHERE tital =%s",(var1,))
    data1 = cur.fetchall()
    cur.close()
    return render_template('company_applicante.html',x=x,data=data,data1=data1,var1=var1)

@app.route('/goback', methods=['POST'])
def goback():
    var1 = request.form.get('tital')
    x = request.form.get('cname')

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM internship")
    data = cur.fetchall()
     
    cur.execute("SELECT * FROM apply WHERE tital =%s",(var1,))
    data1 = cur.fetchall()
    cur.close()
    return render_template('company_applicante.html',x=x,data=data,data1=data1,var1=var1)

@app.route('/some_route', methods=['GET', 'POST'])
def some_route():
    if request.method == 'POST':
        # Handle POST request
        return redirect(request.referrer)
    elif request.method == 'GET':
        # Handle GET request
        return redirect(request.referrer)
    
@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        return f"Welcome {session['username']}! This is your dashboard."
    else:
        return redirect('/login')

@app.route('/login_page_company')
def login_page_company():
    return render_template('Login_company.html')

@app.route('/choiceL')
def choiceL():
    return render_template('choiceL.html')


@app.route('/index')
def index():
    return render_template('companypage.html')

if __name__=="__main__":
    app.run(debug=True)