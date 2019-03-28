--- DATABASE NAME IS wildlife
create database wildlife;

use wildlife;

--- staff table 
CREATE TABLE staff(
    ID varchar(20),
    name varchar(50) NOT NULL,
    designation varchar(50),
    working_hour varchar(10),
    salary int CHECK(salary >= 5000),
    phone varchar(10),
    email varchar(30),
	PRIMARY KEY(ID));

--- tourists table
CREATE TABLE tourist(Reg_No int PRIMARY KEY AUTO_INCREMENT,
                     name varchar(50) NOT NULL,
                     phone varchar(10),
                     email varchar(35),
		     type varchar(10),
		     fee decimal(5,2));
 

--- staff login table
CREATE TABLE staff_login(id varchar(20),
                         pwd varchar(20),
                         FOREIGN KEY(id) REFERENCES staff(ID));

--- admin login table
CREATE TABLE admin_login(id varchar(20),
                         pwd varchar(20),
                         FOREIGN KEY(id) REFERENCES staff(ID));

-- student_ticket table --
CREATE TABLE student_ticket(S_ID varchar(15) PRIMARY KEY,
                            name varchar(50) NOT null,
                            college varchar(50),
                            phone varchar(13),
                            email varchar(30),
                            fee decimal(5,2) DEFAULT 30);

-- camera ticket table --
CREATE TABLE camera_ticket(ticket_no varchar(5) PRIMARY KEY,
                           name varchar(30) not null,
                           cam_sl_no varchar(10),
                           fee decimal(5,2) DEFAULT 50);

-- donation table --
CREATE TABLE donation(name varchar(50),
                      phone varchar(13),
                      email varchar(3),
                      ammount decimal(10,2))

--insert data into staff table --
INSERT INTO `staff` (`ID`, `name`, `designation`, `working_hour`, `salary`, `phone`, `email`) VALUES ('TI001', 'Hemanth', 'directive', '9:30-5:30', '90000', '8892770062', 'hemanthraokn355@gmail.com');

INSERT INTO `staff` (`ID`, `name`, `designation`, `working_hour`, `salary`, `phone`, `email`) VALUES ('MO001', 'ujwala', 'manager', '9:30-5:30', '70000', '8892770062', 'ujwala@gmail.com');

INSERT INTO `staff` (`ID`, `name`, `designation`, `working_hour`, `salary`, `phone`, `email`) VALUES ('ST001', 'raghu', 'TA ', '9:30-5:30', '50000', '898988890', 'raghu@mail.com');

-- insert data into admin login table --
INSERT INTO `admin_login` (`id`, `pwd`) VALUES ('MO001', 'test'), ('TI001', 'test');

-- insert into staff_login --
INSERT INTO `staff_login` (`id`, `pwd`) VALUES ('ST001', 'test');













