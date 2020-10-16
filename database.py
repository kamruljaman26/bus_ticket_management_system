import mysql.connector


# Create DB Connection
my_db = mysql.connector.connect(
    # Cloud Database Information
    host="us-cdbr-east-02.cleardb.com",
    user="bf64f278ee1a59",
    passwd="0ab75167",
    db='heroku_44d0be5b15a852e'
)


# Insert user to DB
def insert_user(name, phone, password, address):
    sql = "INSERT INTO user_info (full_name, phone_num, password, address) VALUES (%s, %s, %s, %s)"
    val = (name, phone, password, address)
    my_cur = my_db.cursor()
    print(my_cur.execute(sql, val))
    my_cur.close()


# Check Login Status
def login_validation(phone_num, password):
    sql = "SELECT * FROM user_info WHERE phone_num = %s;"
    var =(phone_num,)
    my_cur = my_db.cursor()
    my_cur.execute(sql, var)
    result = my_cur.fetchall()
    my_cur.close()
    if len(result) != 0:
        if result[0][3] == password:
            message = 'login successful!'
            return [True, message, result]
        else:
            message = "Username or Password is wrong, Please Try Again"
            return [False, message, result]
    else:
        message = "Username or Password is wrong, Please Try Again"
        return [False, message]