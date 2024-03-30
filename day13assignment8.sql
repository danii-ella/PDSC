
use earlycodeacademy;
create table student_information_form(id int primary key not null, 
firstname varchar(10) not null, 
gender varchar(5) not null, 
address varchar(30) not null, 
guardian varchar(20) not null, 
guardian_contact varchar(40) null, 
minute_from_school varchar(10) not null);
alter table student_information_form add column age varchar(5) not null after gender;
show columns from student_information_form;
select * from student_information_form;
insert into student_information_form(id, firstname, gender, age, address, guardian, guardian_contact, minute_from_school) values
(1,'Ko Ku Jeun','Male', '7', 'Elicot Citi Street', 'StepMother', '08087654321','10 Minutes'),
(2,'Daniel','Male', '7', 'Uru Street House no 3', 'StepFather', '08087667431','20 Minutes'),
(3,'Minnie','Fmale','6', 'Upabio Close House no 1', 'Father and Mother', '0801233567','20 Minutes'),
(4,'Mickey','Male', '8','Elicot close House no 5', 'Mother', '09087654221','50 Minutes'),
(5,'Goldilocks','Fmale','8', 'Bear Estate No 3', 'StepParents', '0912456891','29 Minutes'),
(6,'Snow White','Fmale', '9','Queen Close', 'StepMother', '08087690741','40 Minutes'),
(7,'Aladin','Male', '7', 'Carpet Apartments', 'Father', '08023487094','5 Minutes'),
(8,'Henry Hart','Male', '7', 'Captain Villa', 'Mother', '09078895432','30 Minutes'),
(9,'Phoebe','Fmale','9', 'Thunderman Estate', 'Aunty', '08043214321','10 Minutes'),
(10,'Charlotte','Fmale', '8','Hart Side Apartments', 'Aunty', '06032678900','5 Minutes');
select * from student_information_form;
select firstname, guardian from student_information_form;
update student_information_form set age  = 7 where id = 6;
delete from student_information_form where id = 10;
show indexes from student_information_form;
create index studentgender on student_information_form(gender);
drop index studentgender on student_information_form;