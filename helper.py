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

sql = "INSERT INTO user_info (full_name, phone_num, password, address) VALUES (%s, %s, %s, %s)"
var = ('name', 'phone', 'password', 'address')
