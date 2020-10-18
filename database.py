import mysql.connector
from mysql.connector import Error

# my_db = mysql.connector.connect(
#     # Cloud Database Information
#     host="us-cdbr-east-02.cleardb.com",
#     user="bf64f278ee1a59",
#     passwd="0ab75167",
#     db='heroku_44d0be5b15a852e'
# )

my_db = mysql.connector.connect(
    # Cloud Database Information
    host="localhost",
    user="root",
    passwd="JAMANkamrul1@",
    db='busticket'
)


# Insert user to DB
def insert_user(name, phone, password, address):
    try:
        sql = "INSERT INTO user_info (full_name, phone_num, password, address) VALUES (%s, %s, %s, %s)"
        sql_is_user_available = "SELECT * FROM user_info WHERE phone_num = %s;"
        var = (name, phone, password, address)

        my_cur = my_db.cursor()
        my_cur.execute(sql_is_user_available, (phone,))
        result = my_cur.fetchall()
        print(result)

        if len(result) == 1:
            message = phone+' phone already registered! please try with different phone number.'
            return [False, message]
        else:
            my_cur.execute(sql, var)  # Execute Query
            my_db.commit()  # Commit Query

            message = 'Your registration is successfully complete!'
            return [True, message]
    except Error:
        message = 'Some error occurred!'
        return [False, message]


# Check Login Status
def login_validation(phone_num, password):
    sql = "SELECT * FROM user_info WHERE phone_num = %s;"
    var = (phone_num,)
    my_cur = my_db.cursor()
    my_cur.execute(sql, var)
    result = my_cur.fetchall()
    # my_cur.close()

    if len(result) != 0:
        if result[0][3] == password:
            message = 'login successful!'
            print(result)
            return [True, message, result]
        else:
            message = "Username or Password is wrong, Please Try Again"
            return [False, message, result]
    else:
        message = "Username or Password is wrong, Please Try Again"
        return [False, message]


# create FROM & TO List
def from_to_list():
    from_sql = "SELECT DISTINCT `form` FROM destination;"
    to_sql = "SELECT DISTINCT `to` FROM destination;"
    
    my_cur = my_db.cursor()
    my_cur.execute(from_sql)
    from_list = my_cur.fetchall()

    my_cur = my_db.cursor()
    my_cur.execute(to_sql)
    to_list = my_cur.fetchall()

    from_to = {'from': [], 'to':[]}

    for x in from_list:
        from_to['from'].append(x[0])
    
    for x in to_list:
        from_to['to'].append(x[0])

    return from_to


# Create Avilable Bus List
def create_avil_bus_list(des_from, des_to, date='2020-10-18'):
    sql = "SELECT bus_info.name, destination.bus_num,destination.form,destination.to, destination.start_date,destination.start_time,destination.duration,destination.price FROM destination INNER JOIN bus_info ON bus_info.bus_num=destination.bus_num AND destination.form=%s AND destination.to=%s AND destination.start_date=%s";
    val = (des_from, des_to, date)

    my_cur = my_db.cursor()
    my_cur.execute(sql, val)
    
    return my_cur.fetchall();
