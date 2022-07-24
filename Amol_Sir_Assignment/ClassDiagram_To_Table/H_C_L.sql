create  database Happy_Cruise_Lines_Database;
use Happy_Cruise_Lines_Database;
create table Supplier
(
  Supplier_Number int not null primary key,
  Supplier_Name varchar(233) not null,
  Supplier_Address varchar(233) not null,
  Sales_Rep varchar(233) not null
);
create table Product
(
 Product_Number int not null primary key,
 Product_Category varchar(233) not null,
 Unit_Price float not null
);

create table Ship
(
 Ship_Number int not null primary key,
 Ship_Name varchar(233) not null,
 Ship_Builder varchar(233) not null,
 Launch_Date date not null,
 Gross_Weight float not null
);

create table Cruise
(
 Cruise_Number int not null primary key,
 start_date date not null,
 end_date date not null,
 cruise_director varchar(233) not null
);

create table provision
(
 Supplier_Number int not null,
 Product_Number int not null,
 Cruise_Number  int not null,
 Quantity int not null,
 Date date not null,
 Cost float not null,
 foreign key(Supplier_Number) references Supplier(supplier_number),
 foreign key(Product_Number) references Product(product_number),
 foreign key(Cruise_Number) references Cruise(Cruise_Number)
);

create table Port
(
 port_Name varchar(233) not null,
 Country varchar(233) not null,
 Number_of_Docks int not null,
 Port_Manager varchar(233),
 primary key(port_Name,Country)
);

create table visit
(
  Cruise_Number int not null,
  Port_Name varchar(233) not null,
  Country varchar(233) not null,
  Arrival_Date date not null,
  Departure date not null,
  foreign key(Port_Name,Country) references Port(Port_Name,Country),
  foreign key(Cruise_Number) references Cruise(cruise_number)
);

create table passenger
(
 passenger_Number int not null primary key,
 Passenger_Name varchar(233) not null,
 Home_Address varchar(233) not null,
 Telephone int not null,
 passenger_Numberr int not null,
 foreign key(passenger_numberr) references passenger(passenger_Number)
);

create table passenger_Contact
( 
      passenger_Number int not null,
     Telphone int not null,
     foreign key(passenger_Number) references passenger(passenger_Number)
);
create table toured
(
   passenger_number int not null,
   cruise_Number int not null,
   cabin_Number int not null,
   Fare varchar(233) not null,
   foreign key(passenger_number) references passenger(passenger_number),
  foreign key(cruise_number) references cruise(cruise_number)
);

create table tour
(
  tour_number int not null primary key,
  tour_Name varchar(233) not null,
  Duration varchar(233) not null,
  price float not null
);

create table Toured2
(
 passenger_number int not null,
 cruise_number int  not null,
 tour_number int not null,
 Date1 date not null,
 foreign key(passenger_number) references passenger(passenger_number),
 foreign key(cruise_number) references cruise(cruise_number),
 foreign key(tour_number) references tour(tour_number)
);
    