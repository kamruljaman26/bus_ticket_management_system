create database bus_ticket_management_system;

...........................................
-- Adib
-- Don't crate phone number in int format
-- user should have password
-- table & column name should lower case

-- CREATE TABLE user_info
CREATE TABLE user_info(id INT(11) AUTO_INCREMENT UNIQUE,full_name VARCHAR(30) NOT NULL,
phone_num varchar(14) NOT NULL,password varchar(100) NOT NULL, address VARCHAR(255),PRIMARY KEY(phone_num));

-- INSERT INTO user_info
INSERT INTO user_info(full_name, phone_num, password, address)
VALUES ('Kamrul Jaman','01686985152','12345678','house-1/c, road-14, nukunja-2, khilkhet');


.............................................
CREATE TABLE ticket(ticket_no varchar(7) not null,
user_phone varchar(11) not null,primary key(ticket_no),
foreign key(user_phone)references user(user_phone));
.............................
create table bus_info(bus_no varchar(6) not null,primary key(bus_no));
......................................
alter table ticket add (bus_no varchar(6) not null,foreign key(bus_no)references bus_info(bus_no));
..........................................
create table seat_info(seat_no varchar(2) not null primary key);
...................................
create table booking(seat_no varchar(2) not null,bus_no varchar(6) not null,foreign key(seat_no) references seat_info(seat_no),foreign key(bus_no)references bus_info(bus_no));
.............................................
create table who_booked(ticket_no varchar(7) not null,seat_no varchar(2) not null, foreign key(ticket_no)references ticket(ticket_no),foreign key(seat_no)references seat_info(seat_no));
.............................................
create table destination(location varchar(15) not null,place varchar(15) not null ,primary key(location),foreign key(place)references destination(location));
.............................................
alter table ticket add (place varchar(15) not null,foreign key(place)references destination(place));
.............................................
alter table bus_info add(place varchar(15), foreign key(place) references destination(place));
.............................................
create table departure_time(place varchar(15) not null, set_time datetime not null unique,foreign key(place) references destination(place));
...........................................
create table source(buy_location varchar(15) not null primary key);
...........................................
alter table ticket add(buy_location varchar(15) not null,foreign key(buy_location) references source(buy_location));
............................................

create table details(sl_no int not null auto_increment,primary key(sl_no),
ticket_no varchar(7) not null,buy_location varchar(15) not null,
set_time datetime not null,bus_no varchar(6),user_phone varchar(11) not null,
seat_no varchar(2)not null,place varchar(15)not null, foreign key(ticket_no)
references ticket(ticket_no),foreign key(buy_location) references source(buy_location),
foreign key(set_time) references departure_time(set_time),foreign key(bus_no)
references bus_info(bus_no),foreign key(user_phone)
references user(user_phone),foreign key(seat_no) references seat_info(seat_no),
foreign key(place) references destination(place));
.............................................
create table details(sl_no int not null auto_increment,primary key(sl_no), ticket_no varchar(7) not null,buy_location varchar(15) not null, set_time datetime not null,bus_no varchar(6),user_phone varchar(11) not null,seat_no varchar(2)not null,place varchar(15)not null, foreign key(ticket_no) references ticket(ticket_no),foreign key(buy_location) references source(buy_location),foreign key(set_time) references departure_time(set_time),foreign key(bus_no) references bus_info(bus_no),foreign key(user_phone) references user(user_phone),foreign key(seat_no) references seat_info(seat_no),foreign key(place) references destination(place));
.............................................
