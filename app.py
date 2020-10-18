from flask import Flask, render_template, request, session, redirect, url_for
import database as db
from database import create_avil_bus_list
from datetime import timedelta


app = Flask(__name__)
app.secret_key = 'asdfghjklppoiuytrewqasdfghjk' # secret_key session end-to-end ecription 
app.permanent_session_lifetime = timedelta(days=1)


# Handle Login
@app.route('/', methods=['POST', 'GET'])
def sign_in():
    if request.method == 'POST':
        phone_num = request.form.get("phone_num")
        password = request.form.get("password")
        status = db.login_validation(phone_num=phone_num, password=password)

        # create session
        session['user_name'] = str(status[2][0][1])  # User Name
        session['user_phone'] = str(status[2][0][2]) # User Phone Number
        session['user_address'] = str(status[2][0][4]) # User Address
        session.permanent = True

        if status[0]:
            return redirect(url_for('index'))
        else:
            return render_template('login.html', alret_message=status[1], show_alret=True)
    elif request.method == 'GET':
        if 'user_phone' in session:
            return redirect(url_for('index'))
        else:
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
        if 'user_name' in session:
            full_name = session['user_name']
            return render_template('index.html',full_name=full_name)
        else:
            return render_template('registration.html')


# Logout & Delete Session Data
@app.route('/log-out',methods=['GET', 'POST'])
def log_out():
    # Delete session data
    session.pop('user_name', None)
    session.pop('user_phone', None)
    session.pop('user_address', None)
    return redirect(url_for('sign_in'))


# Home page with login
@app.route('/index', methods=['GET', 'POST'])
def index():
    if 'user_name' in session:
        from_to_list = db.from_to_list()
        return render_template('index.html', from_to_list=from_to_list)
    else:
        return redirect(url_for('sign_in'))


# Avilable Bus List 
@app.route('/bus-list', methods=['GET', 'POST'])
def bus_list():
    des_from = request.form.get("from")
    des_to = request.form.get("to")
    date = request.form.get("date")

    print(des_from, des_to, date)

    bus_list = create_avil_bus_list(des_from, des_to, date)
    print(bus_list)
    return render_template('bus_list.html',bus_list=bus_list)


# My Tickets
@app.route('/my-ticket', methods=['GET', 'POST'])
def my_ticket():
    if request.method == 'GET':
        return render_template('my_ticket.html')


# Main Function
if __name__ == '__main__':
    app.run(debug=True)

