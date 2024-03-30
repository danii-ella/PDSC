create database J_Waec_System;
use J_Waec_System;
#mysql clause
select sex, age, address from studentper order by age;
select sex, age, address from studentper order by age desc;
select distinct age from studentper;
select distinct age from studentper order by age;
select age from studentper where age = 10;
#agg function [avg, min, max, count, sum, first, last]
select Mjob, avg (JS11stterm) from studentper group by Mjob;
select Mjob, min(JS11stterm) from studentper group by Mjob;
select Mjob, max(JS11stterm) from studentper group by Mjob;
select Mjob, count(JS11stterm) from studentper group by Mjob;
select Mjob, sum(JS11stterm) from studentper group by Mjob;
select * from studentper limit 2;
select * from studentper order by age desc limit 2;
#mysql control flow program
select age, sex, JS11stterm, if (JS11stterm >= 90, 'Yes', 'No') as result from studentper;
select age, sex, JS11stterm, JS12ndterm, ifnull(JS11stterm,JS12ndterm) as result from studentper;
select age, sex, JS11stterm, JS12ndterm, nullif(JS11stterm,JS12ndterm) as result from studentper;
select age, sex, famsize, address, JS32ndterm,
	case 	
		when JS32ndTerm >= 70 and JS32ndTerm <=100 then 'A'
        when JS32ndTerm >= 60 and JS32ndTerm <=69.99 then 'B'
        when JS32ndTerm >= 50 and JS32ndTerm <=59.99 then 'C'
        when JS32ndTerm >= 40 and JS32ndTerm <=49.99 then 'D'
        when JS32ndTerm >= 30 and JS32ndTerm <=39.99 then 'E'
        else 'F'
end as GRADE from studentper;
create table student_personal_info select sex, age, address, famsize, Pstatus, Medu, Fedu, Mjob, Fjob, guardian from studentper;
create table student_activities select traveltime, studytime, activities, paid, health, Emotions, famsup, schoolsup, internet from studentper;
create table student_score select JS11stterm, JS12ndTerm, JS13rdTerm, JS21stTerm, JS22ndTerm, `JS23rd Term`, JS31stTerm, JS32ndTerm from studentper;