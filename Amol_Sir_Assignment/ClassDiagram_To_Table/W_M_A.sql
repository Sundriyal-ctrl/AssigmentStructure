create database World_Music_Association;
use World_Music_Association;
create table Orchestra
(
  Orchestra_Name int not null primary_key,
  city varchar(233) not null,
  Country varchar(233) not null,
  Music_Director varchar(233) not null
);

create table Composer
(
  composer_Name varchar(233) not null primary key,
  Country varchar(233) not null,
  Date_Of_Birth date not null
);

create table composition
(
 composition_Name int not null,
 Composer_Name varchar(233) not null,
 Year int not null,
 primary key(composition_Name,Composer_Name),
 foreign key(Composer_Name) references Composer(Composer_Name),
);

create table Recording
(
  Orchestra_Name varchar(233) not null,
  Composition_Name varchar(233) not null,
  Composer_Name varchar(233),
  year int not null,
  price float not null,
 foreign key(Compostion_Name,Composer_Name) references Composition(Composition_Name,Composer_Name),
 foreign key(Orchestra_Name) references Orchestra(Orchestra_Name)
);

create table Musician
(
 Musician_Number int not null primary key,
 Musician_Name varchar(233) not null,
 Instrument varchar(233) not null,
 Annual_Salary float not null,
 foreign key(Orchestra_Name) references Orchestra(Orchestra_Name)
);
create table degree
(
 Degree varchar(233) not null primary key,
 Musician_Number int not null,
 University_Year not null,
 foreign key(Musician_Number) references Musician(Musician_Number)
);













CREATE DATABASE general_hardware_db;

CREATE TABLE office (
	id bigserial,
	telephone varchar(50) NULL,
	size_sq_ft int8 NULL,
	CONSTRAINT sales_pkey PRIMARY KEY (id)
);

CREATE TABLE product (
	id bigserial,
	name varchar(50) NULL,
	unit_price NUMERIC (4, 2),
	CONSTRAINT product_pkey PRIMARY KEY (id)
);


CREATE TABLE salesperson (
	id bigserial,
	name varchar(50) NULL,
	commision_percentage int8 NULL,
	year_of_hire int8 NOT NULL,
	office_id int8 NOT NULL,
	CONSTRAINT salesperson_pkey PRIMARY KEY (id),
	CONSTRAINT salesperson_fk1 FOREIGN KEY (office_id) REFERENCES office(id)
);


CREATE TABLE customer (
	id bigserial,
	cust_name varchar(50) NULL,
	salesperson_id int8 NULL,
	hq_city varchar(50) NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id),
	CONSTRAINT customer_fk1 FOREIGN KEY (salesperson_id) REFERENCES salesperson(id)
);


CREATE TABLE employee (
	id bigserial,
	customer_id int8 NULL,
	name varchar(50) NULL,
	job_title varchar(50) NULL,
	CONSTRAINT employee_fk1 FOREIGN KEY (customer_id) REFERENCES customer(id)
);


CREATE TABLE sales (
	salesperson_id int8 NULL,
	product_id int8 NULL,
	quantity int8 NULL,
	CONSTRAINT sales_fk1 FOREIGN KEY (salesperson_id) REFERENCES salesperson(id),
	CONSTRAINT sales_fk2 FOREIGN KEY (product_id) REFERENCES product(id)
);


