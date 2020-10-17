from flask import Flask, render_template, request, session, redirect, url_for
import database as db
from datetime import timedelta

app = Flask(__name__)
app.secret_key = 'asdfghjklppoiuytrewq'


# Handle Login
@app.route('/', methods=['POST', 'GET'])
def sign_in():
    if request.method == 'POST':
        phone_num = request.form.get("phone_num")
        password = request.form.get("password")
        status = db.login_validation(phone_num=phone_num, password=password)

        # create session
        session['user_name'] = str(status[2][0][1])

        if status[0]:
            return redirect(url_for('index'))
        else:
            return render_template('login.html', alret_message=status[1], show_alret=True)
    elif request.method == 'GET':
        return render_template('login.html')


# Handle Registration
@app.route('/sign-up', methods=['POST', 'GET'])
def sign_up():
    if request.method == 'POST':
        name = request.form.get("full_name")
        phone_num = request.form.get('phone_num')
        password = request.form.get('pass')
        confirm_pass = request.form.get('confirm_pass')
        address = request.form.get('address')

        if password == confirm_pass:
            # Insert to database
            message = db.insert_user(name=name, phone=phone_num, password=password, address=address)
            return render_template('registration.html', show_alret=True, alret_message=message[1])
        else:
            message = 'Something Error!'
            return render_template('registration.html', show_alret=True, alret_message=message)

    elif request.method == 'GET':
        return render_template('registration.html')


# Home page with login
@app.route('/index', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

# Home page with login
@app.route('/bus-list', methods=['GET', 'POST'])
def bus_list():
    loooop = [0,1,2,3,4,5,6,7,8,9]
    return render_template('bus_list.html',loooop=loooop)


# Main Function
if __name__ == '__main__':
    app.run(debug=True)

