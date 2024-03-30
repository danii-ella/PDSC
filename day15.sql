use J_Waec_System;
alter table student_score add column StudentID int primary key not null auto_increment first;
select * from student_score;
alter table student_personal_info add column StudentID int primary key not null auto_increment first;
alter table student_activities add column StudentID int primary key not null auto_increment first;
#mysql conditions
select * from studentper;
select * from studentper where (age <= 13 and age = 12) and schoolsup = 'yes';
select * from studentper where guardian = 'father' or traveltime >= 2;
select * from studentper where (age <= 13 and age = 12) or schoolsup = 'yes';
select * from studentper where JS11stterm between 25 and 60;
select * from studentper where JS11stterm not between 25 and 60;
select * from studentper where famsup is null;
select * from studentper where famsup is not null;
select * from studentper where Mjob like 'C%';
select * from studentper where Mjob like '%R';
select * from studentper where Mjob like '__s%';
select * from studentper where Mjob like '______';
#mysqljoin
select student_personal_info.sex, student_personal_info.age, student_personal_info.address, student_personal_info.guardian,
student_score.JS11stterm, student_score.JS12ndTerm, student_score.JS13rdTerm from student_personal_info inner join
student_score on student_personal_info.StudentID = student_score.StudentID;

select student_personal_info.sex, student_personal_info.age, student_personal_info.address, student_personal_info.guardian,
student_score.JS11stterm, student_score.JS12ndTerm, student_score.JS13rdTerm from student_personal_info right join
student_score on student_personal_info.StudentID = student_score.StudentID;

select student_personal_info.sex, student_personal_info.age, student_personal_info.address, student_personal_info.guardian,
student_score.JS11stterm, student_score.JS12ndTerm, student_score.JS13rdTerm from student_personal_info left join
student_score on student_personal_info.StudentID = student_score.StudentID;

select student_personal_info.sex, student_personal_info.age, student_personal_info.address, student_personal_info.guardian,
student_score.JS11stterm, student_score.JS12ndTerm, student_score.JS13rdTerm from student_personal_info cross join
student_score on student_personal_info.StudentID = student_score.StudentID;



Create database employee_system;
use employee_system;
select avg(age) as results from hr_analytics;
select distinct attrition from hr_analytics;
select attrition, count(attrition) as result from hr_analytics where attrition = 'Yes';
select * from hr_analytics;
select BusinessTravel, count(BusinessTravel)as result from hr_analytics group by BusinessTravel;
select avg(DailyRate) as dailyresult from hr_analytics;
select Department, count(Department) as department from hr_analytics group by Department;
select avg(DistanceFromHome) as dfh from hr_analytics;
select Education, count(Education) as el from hr_analytics group by Education;
select EducationField, count(EducationField) as ef from hr_analytics group by EducationField order by ef DESC limit 1;

select Age as Department from hr_analytics;
select avg(MonthlyIncome) as monthlyincome from hr_analytics group by JobLevel and JobRole;
select avg(WorkLifeBalance) as WLB from hr_analytics group by Department;
select avg(EnvironmentSatisfaction) as ES from hr_analytics group by JobRole;
select YearsAtCompany, count(YearsAtCompany) as YAC from hr_analytics group by YearsAtCompany, JobLevel and JobRole;
select avg(JobSatisfaction) as JS from hr_analytics group by MaritalStatus;
select RelationshipSatisfaction, count(RelationshipSatisfaction) as RS from hr_analytics group by RelationshipSatisfaction, JobRole and JobLevel;
select EmployeeCount as EC from hr_analytics group by EmployeeCount, Department;
select StandardHours as SH from hr_analytics group by StandardHours, JobLevel and JobRole;
select avg(JobInvolvement) as JI from hr_analytics group by Gender;
select avg(HourlyRate) as HR from hr_analytics group by JobLevel and JobRole;
select avg(DistanceFromHome) as DFH from hr_analytics group by JobRole and JobLevel;
select avg(StockOptionLevel) as SOL from hr_analytics group by JobRole and JobLevel;
select avg(TrainingTimesLastYear) as TTLY from hr_analytics group by JobRole and JobLevel;
select avg(TotalWorkingYears) as TWY from hr_analytics group by JobRole and JobLevel;
select avg(YearsSinceLastPromotion) as YSLP from hr_analytics group by JobRole and JobLevel;