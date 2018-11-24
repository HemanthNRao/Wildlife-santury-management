CREATE DATABASE KEB;

USE KEB;

CREATE TABLE customer(usn varchar(15) PRIMARY KEY, name varchar(50) NOT NULL, address varchar(200), phone varchar(10) NOT NULL, email varchar(50), category varchar(30) NOT NULL);

CREATE TABLE cust_login(usn varchar(15) PRIMARY KEY, pwd varchar(15) not null, FOREIGN KEY(usn) REFERENCES customer(usn));

CREATE TABLE staff_login(eid varchar(15) PRIMARY KEY, pwd varchar(15) not null);

CREATE TABLE cust_reg(usn varchar(15) PRIMARY KEY,
                      phone varchar(12) NOT null,
                      email varchar(30),
                 	  FOREIGN KEY(usn) REFERENCES customer(usn));
                 	  
CREATE TABLE units(usn varchar(50) PRIMARY KEY,
                   month varchar(15) NOT NULL,
                   units decimal(7,3) NOT NULL);
                      
                