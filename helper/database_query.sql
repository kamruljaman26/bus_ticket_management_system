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
INSERT INTO bus_info(name, bus_num) VALUES ('Shyamoli SP', 'DH00112234');
INSERT INTO bus_info(name, bus_num) VALUES ('NR Travels', 'DH00112244');
INSERT INTO bus_info(name, bus_num) VALUES ('Shohagh Paribahan', 'DH00112245');

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
  `start_time` DATETIME NOT NULL,
  `duration` FLOAT(8,5) NOT NULL,
  `price` INT(5) NOT NULL,
  foreign key(bus_num) references bus_info(bus_num)
);

..............................................
-- Bus Seat Info

CREATE TABLE `Seat_Info` (
  `seat_id` INT(11) AUTO_INCREMENT NOT NULL UNIQUE,
  `sl_no` INT(5) NOT NULL,
  `is_available` TINYINT(1) DEFAULT 0,
  `phone_num` varchar(14),
  `ticket_id` INT(11),
  `bus_num` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(bus_num) references bus_info(bus_num),
  foreign key(ticket_id) references ticket(bus_num),
  foreign key(phone_num) references user_info(bus_num)
);

