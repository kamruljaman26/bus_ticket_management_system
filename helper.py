from database import *

# my_db = mysql.connector.connect(
#     # Cloud Database Information
#     host="us-cdbr-east-02.cleardb.com",
#     user="bf64f278ee1a59",
#     passwd="0ab75167",
#     db='heroku_44d0be5b15a852e'
# )

# my_db = mysql.connector.connect(
#     # Cloud Database Information
#     host="localhost",
#     user="root",
#     passwd="JAMANkamrul1@",
#     db='busticket'
# )

#var = ('name', 'phone', 'password', 'address')

print(create_avil_bus_list(des_from='Dhaka', des_to='Chittagong', date='2020-10-19'))