#Exercise
#in the previous database create the following tables
#stafftable [ID, Staffname, Staffgender, StaffDOB, ]
use earlycodeacademy;
create table staff_table(ID int primary key not null,
StaffName  varchar(25) not null, 
StaffGender varchar(10) not null, 
StaffDOB date not null, 
StaffContact varchar(20) not null, 
StaffAddress  varchar(50) not null, 
StaffQualification  varchar(100) not null, 
StaffNUmberofSubjectTaught varchar (10) not null, 
StaffTaughtName  varchar(80) not null, 
StaffClassTeacher  varchar(25) not null);
create table payment_table(PaymentID int primary key not null,
StudentID int not null,
StudentName varchar(25) not null,
AmountPaid int not null,
DateofPayment varchar(30) not null,
BalancetobePaid int not null);

insert into staff_table(ID, StaffName, StaffGender, StaffDOB, StaffContact, StaffAddress, StaffQualification, StaffNUmberofSubjectTaught, 
StaffTaughtName, StaffClassTeacher) values
(1, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(2, Michelle Modson, Female, 13/9/1992, 08749235965, House no 5 GC estate, masters_mathematics, 2, Mathematics_Physics, P2)
(3, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(4, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(5, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(6, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(7, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(8, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(9, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
(10, Micheal Ihedigbo, Male, 23/11/1990, 09134568792, House no 3 UB estate, masters_mathematics, 2, Mathematics_Physics, P2)
