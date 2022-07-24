create database central_hospital_database;
use central_hospital_database;
create table INSURANCE_COMPANY
(
  company_Name varchar(255) not null primary key, 
  City varchar(255) not null, 
  State varchar(255) not null, 
  President varchar(255) not null
);
create table INSURANCE_COMPANY_TELEPHONE
(
 company_Name varchar(255) not null, 
 Telephone int not null, 
 foreign key(company_Name) references INSURANCE_COMPANY(company_Name)
 );
create table PATIENT
(
 patient_Number int not null primary key, 
 patient_Name varchar(255) not null,
 Age int not null,
 City varchar(255) not null, 
 State varchar(255) not null
);
create table PATIENT_ADDRESS
(
patient_Number int not null,
 Address varchar(255)
);
create table CLAIM
(
 claim_Number int not null primary key, 
 company_Name varchar(255) not null, 
 patient_Number int not null,
 Date date not null, 
 Diagnosis varchar(255) not null, 
 Amount float not null, 
 foreign key(company_Name) references INSURANCE_COMPANY(company_Name), 
 foreign key(patient_Number) references Patient(patient_Number)
);
create table OPERATION
(
 operation_Name varchar(255) not null primary key,
 Duration int not null,
 Cost float not null
);
 create table DOCTOR
 (
  doctor_Number int not null primary key,
  office_Number int not null,
  doctor_Number_R int not null, 
  foreign key(doctor_Number_R) references DOCTOR(doctor_Number)
);
create table DOCTOR_Telephone
(
 doctor_Number int not null,
 Telephone int not null, 
 foreign key(doctor_Number) references DOCTOR(doctor_Number)
);
create table OPERATION
(
 patient_Number int not null, 
 doctor_Number int not null,
 operation_Name varchar(255) not null, 
 Date date not null primary key, 
 start_Time int not null, 
 end_Time int not null, 
 operating_Room_No int not null,
 foreign key(patient_Number) references PATIENT(patient_Number),
 foreign key(doctor_Number) references DOCTOR(doctor_Number), 
 foreign key(operation_Name) references OPERATION_TYPE(operation_Name)
);
create table DEGREE
(
 doctor_Number int not null, 
 degree_Type varchar(255) not null primary key,
 Year int not null, 
 Major varchar(255) not null,
 University varchar(255) not null,
 foreign key(doctor_Number) references DOCTOR(doctor_Number)
);
create table DEPARTMENT
(
 department_Number int not null primary key,
 office_Number int not null, 
 administrator varchar(255)
);
create table DEPARTMENT_TELEPHONE
(
 department_Number int not null, 
 telephone int not null,
 foreign key(department_Number) references DEPARTMENT(department_number)
);
create table NURSE
(
 nurse_Number int not null Primary Key,
 nurse_Name varchar(255) not null, 
 Certification varchar(255) not null, 
 year_Hired int  not null,
 nurse_Number_R int not null, 
 foreign key(nurse_Number_R) references NURSE(nurse_Number)
 );