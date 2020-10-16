from flask import Flask, render_template, request
import database as db

app = Flask(__name__)
user = None


# Handle Login
@app.route('/', methods=['POST', 'GET'])
def sign_in():
    if request.method == 'POST':
        phone_num = request.form.get("phone_num")
        password = request.form.get("password")
        status = db.login_validation(phone_num=phone_num, password=password)
        if status[0]:
            # need to implement
            return status[1]
        else:
            return render_template('login.html', alret_message=status[1], show_alret=True)
    elif request.method == 'GET':
        return render_template('login.html')


# Handle Registration
@app.route('/sign-up', methods=['POST', 'GET'])
def sign_up():
    if request.method == 'POST':
        name = request.form.get("name")


        return render_template('registration.html')

    elif request.method == 'GET':
        return render_template('registration.html')


# Home page with login
@app.route('/home', methods=['GET', 'POST'])
def home():
    pass


# Main Function
if __name__ == '__main__':
    app.run()
