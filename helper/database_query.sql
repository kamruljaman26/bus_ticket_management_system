create database busticket;

...........................................
-- User Info

CREATE TABLE user_info(id INT(11) AUTO_INCREMENT UNIQUE,
full_name VARCHAR(30) NOT NULL,
phone_num varchar(14) NOT NULL,
password varchar(100) NOT NULL, 
address VARCHAR(255),PRIMARY KEY(phone_num));

INSERT INTO user_info(full_name, phone_num, password, address)
VALUES ('Kamrul Jaman','01686985152','12345678','house-1/c, road-14, nukunja-2, khilkhet');

.............................................
-- Bus Info  -- 

CREATE TABLE `Bus_Info` (
  `name` VARCHAR(100) NOT NULL,
  `bus_num` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`bus_num`)
);

INSERT INTO bus_info(name, bus_num) VALUES ('Hanif Enterprise', 'DH00112233');
INSERT INTO bus_info(name, bus_num) VALUES ('Hanif Enterprise', 'DH00112247');
INSERT INTO bus_info(name, bus_num) VALUES ('Hanif Enterprise', 'DH00112246');
INSERT INTO bus_info(name, bus_num) VALUES ('Shyamoli SP', 'DH00112234');
INSERT INTO bus_info(name, bus_num) VALUES ('Shyamoli SP', 'DH00112248');
INSERT INTO bus_info(name, bus_num) VALUES ('Shyamoli SP', 'DH00112249');
INSERT INTO bus_info(name, bus_num) VALUES ('NR Travels', 'DH00112244');
INSERT INTO bus_info(name, bus_num) VALUES ('NR Travels', 'DH00112250');
INSERT INTO bus_info(name, bus_num) VALUES ('NR Travels', 'DH00112251');
INSERT INTO bus_info(name, bus_num) VALUES ('Shohagh Paribahan', 'DH00112245');
INSERT INTO bus_info(name, bus_num) VALUES ('Shohagh Paribahan', 'DH00112252');
INSERT INTO bus_info(name, bus_num) VALUES ('Shohagh Paribahan', 'DH001122453');

SELECT * FROM bus_info;

.............................................
-- Bus Ticket

CREATE TABLE `Ticket` (
  `ticket_id` INT(11) NOT NULL,
  `bus_num` VARCHAR(20) NOT NULL,
  `phone_num` VARCHAR(14),
  PRIMARY KEY (`ticket_id`),
  foreign key(bus_num) references bus_info(bus_num),
  foreign key(phone_num) references user_info(phone_num)
);

.............................................
-- Bus Destination

CREATE TABLE `Destination` (
  `bus_num` VARCHAR(20) NOT NULL UNIQUE,
  `form` VARCHAR(30) NOT NULL,
  `to` VARCHAR(30) NOT NULL,
  `start_date` DATE NOT NULL,
  `start_time` Time not null,
  `duration` FLOAT(8,5) NOT NULL,
  `price` INT(5) NOT NULL,
  foreign key(bus_num) references bus_info(bus_num)
);

INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` , `duration`, `price`) VALUES ('DH00112233', 'Dhaka', 'Chittagong', '2020-10-19','8:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` , `duration`, `price`) VALUES ('DH00112234', 'Dhaka', 'Chittagong', '2020-10-19','9:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` ,`duration`, `price`) VALUES ('DH00112244', 'Dhaka', "Cox's Bazar", '2020-10-19','9:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112245', 'Chittagong', 'Dhaka', '2020-10-19','10:00:00', 7.30, 700);

INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` , `duration`, `price`) VALUES ('DH00112233', 'Dhaka', 'Chittagong', '2020-10-19','8:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` , `duration`, `price`) VALUES ('DH00112234', 'Dhaka', 'Chittagong', '2020-10-19','9:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time` ,`duration`, `price`) VALUES ('DH00112244', 'Dhaka', "Cox's Bazar", '2020-10-19','9:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112245', 'Chittagong', 'Dhaka', '2020-10-19','10:00:00', 7.30, 700);

INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112232', 'Comillah', 'Dhaka', '2020-10-12','10:00:00', 7.30, 500);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112239', 'Chittagong', 'feni', '2020-10-20','10:00:00', 7.30, 400);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112248', 'borohat', 'chittagong', '2020-10-19','10:00:00', 7.30, 250);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112246', 'dhaka', 'bandarban', '2020-10-16','10:00:00', 7.30, 900);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112249', 'sajek', 'Dhaka', '2020-10-18','10:00:00', 7.30, 850);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112250', 'bogura', 'Dhaka', '2020-10-17','10:00:00', 7.30, 450);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112251', 'dhaka', 'bogura', '2020-10-15','10:00:00', 7.30, 450);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112253', 'gazipur', 'Dhaka', '2020-10-14','10:00:00', 7.30, 300);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112254', 'rangamati', 'Dhaka', '2020-10-19','10:00:00', 7.30, 950);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112256', 'rajshahi', 'Dhaka', '2020-10-13','10:00:00', 7.30, 750);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112244', 'dhaka', 'shitakundo', '2020-10-19','10:00:00', 7.30, 500);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112258', 'noyakhali', 'Dhaka', '2020-10-23','10:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112259', 'barishal', 'Dhaka', '2020-10-24','10:00:00', 7.30, 700);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112255', 'rangpur', 'Dhaka', '2020-10-19','10:00:00', 7.30, 600);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112261', 'hili', 'Dhaka', '2020-10-08','10:00:00', 7.30, 900);
INSERT INTO destination(`bus_num`, `form`, `to`, `start_date`,`start_time`, `duration`, `price`) VALUES ('DH00112262', 'dhaka', 'rangamati', '2020-10-21','10:00:00', 7.30, 700);
..............................................
-- Bus Seat Info

CREATE TABLE `Seat_Info` (
  `seat_id` INT(11) AUTO_INCREMENT NOT NULL UNIQUE,
  `sl_no` INT(5) NOT NULL,
  `is_available` TINYINT(1) DEFAULT 0,
  `phone_num` varchar(14),
  `ticket_id` INT(11),
  `bus_num` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`seat_id`),
  foreign key(bus_num) references bus_info(bus_num),
  foreign key(ticket_id) references ticket(ticket_id),
  foreign key(phone_num) references user_info(phone_num)
);


--
SELECT bus_info.name, destination.bus_num,destination.form,destination.to,
destination.start_date,destination.start_time,destination.duration
FROM destination INNER JOIN bus_info ON bus_info.bus_num=destination.bus_num and
destination.form="Dhaka" and destination.to="Chittagong" and destination.start_date="2020-10-18";


