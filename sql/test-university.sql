# database level test;
;
## 可以创建或删除数据库实例，可以在数据库实例中切换。;
;
drop database university;
create database university;
use database university;
show databases;
show database university;
;
# DDL test;
;
## 主键支持多列。;
;
create table classroom (building  string(15), room_number  string(7), capacity  double,primary key (building, room_number));;
create table classroom1 (building  string(15), room_number  string(7), capacity  double,unique (building, room_number));;
create table department(dept_name  string(20), building  string(15), budget  double ,primary key (dept_name));;
create table course(course_id  string(8), title  string(50), dept_name  string(20),credits  double ,primary key (course_id));;
create table instructor(id  string(5), name  string(20) not null, dept_name  string(20), salary  double ,primary key (id));;
create table section(course_id  string(8),  sec_id  string(8),semester  string(6), year  int , building  string(15),room_number  string(7),time_slot_id  string(4),primary key (course_id, sec_id, semester, year));;
create table teaches(id  string(5), course_id  string(8),sec_id  string(8), semester  string(6),year  int,primary key (id, course_id, sec_id, semester, year));;
create table student(id  string(5), name  string(20) not null, dept_name  string(20), tot_cred  double ,primary key (id));;
create table takes(id  string(5), course_id  string(8),sec_id  string(8), semester  string(6),year  int,grade  string(2),primary key (id, course_id, sec_id, semester, year));;
create table advisor(s_id  string(5),i_id  string(5),primary key (s_id));;
create table time_slot(time_slot_id  string(4),day  string(1),start_hr  int ,start_min  int ,end_hr  int ,end_min  int ,primary key (time_slot_id, day, start_hr, start_min));;
create table prereq(course_id  string(8), prereq_id  string(8),primary key (course_id, prereq_id));
;
# data preparation;
;
delete from prereq;;
delete from time_slot;;
delete from advisor;;
delete from takes;;
delete from student;;
delete from teaches;;
delete from section;;
delete from instructor;;
delete from course;;
delete from department;;
delete from classroom;;
insert into classroom1 values ('Packard', '101', '500');;
insert into classroom values ('Packard', '101', '500');;
insert into classroom values ('Painter', '514', '10');;
insert into classroom values ('Taylor', '3128', '70');;
insert into classroom values ('Watson', '100', '30');;
insert into classroom values ('Watson', '120', '50');;
insert into department values ('Biology', 'Watson', '90000');;
insert into department values ('Comp. Sci.', 'Taylor', '100000');;
insert into department values ('Elec. Eng.', 'Taylor', '85000');;
insert into department values ('Finance', 'Painter', '120000');;
insert into department values ('History', 'Painter', '50000');;
insert into department values ('Music', 'Packard', '80000');;
insert into department values ('Physics', 'Watson', '70000');;
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');;
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');;
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');;
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');;
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');;
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');;
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');;
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');;
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');;
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');;
insert into course values ('HIS-351', 'World History', 'History', '3');;
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');;
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');;
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');;
insert into instructor values ('12121', 'Wu', 'Finance', '90000');;
insert into instructor values ('15151', 'Mozart', 'Music', '40000');;
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');;
insert into instructor values ('32343', 'El Said', 'History', '60000');;
insert into instructor values ('33456', 'Gold', 'Physics', '87000');;
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');;
insert into instructor values ('58583', 'Califieri', 'History', '62000');;
insert into instructor values ('76543', 'Singh', 'Finance', '80000');;
insert into instructor values ('76766', 'Crick', 'Biology', '72000');;
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');;
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');;
insert into section values ('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B');;
insert into section values ('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A');;
insert into section values ('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H');;
insert into section values ('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F');;
insert into section values ('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E');;
insert into section values ('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A');;
insert into section values ('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D');;
insert into section values ('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B');;
insert into section values ('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C');;
insert into section values ('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A');;
insert into section values ('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C');;
insert into section values ('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B');;
insert into section values ('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C');;
insert into section values ('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D');;
insert into section values ('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');;
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2009');;
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2010');;
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2009');;
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2010');;
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2010');;
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2009');;
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2010');;
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2010');;
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2010');;
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2009');;
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2010');;
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2009');;
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2009');;
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2010');;
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2009');;
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');;
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');;
insert into student values ('19991', 'Brandt', 'History', '80');;
insert into student values ('23121', 'Chavez', 'Finance', '110');;
insert into student values ('44553', 'Peltier', 'Physics', '56');;
insert into student values ('45678', 'Levy', 'Physics', '46');;
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');;
insert into student values ('55739', 'Sanchez', 'Music', '38');;
insert into student values ('70557', 'Snow', 'Physics', '0');;
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');;
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');;
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');;
insert into student values ('98988', 'Tanaka', 'Biology', '120');;
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2009', 'A');;
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2009', 'A-');;
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2009', 'C');;
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2009', 'A');;
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2010', 'A');;
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2009', 'A');;
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2010', 'B');;
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2010', 'C+');;
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2009', 'B-');;
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2009', 'F');;
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2010', 'B+');;
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2010', 'B');;
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2009', 'A-');;
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2009', 'B+');;
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2010', 'A-');;
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2009', 'A');;
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2010', 'A');;
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2009', 'C');;
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2009', 'C-');;
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2010', 'B');;
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2009', 'A');;
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2010', null);;
insert into advisor values ('00128', '45565');;
insert into advisor values ('12345', '10101');;
insert into advisor values ('23121', '76543');;
insert into advisor values ('44553', '22222');;
insert into advisor values ('45678', '22222');;
insert into advisor values ('76543', '45565');;
insert into advisor values ('76653', '98345');;
insert into advisor values ('98765', '98345');;
insert into advisor values ('98988', '76766');;
insert into time_slot values ('A', 'M', 8, 0, 8, 50);;
insert into time_slot values ('A', 'W', 8, 0, 8, 50);;
insert into time_slot values ('A', 'F', 8, 0, 8, 50);;
insert into time_slot values ('B', 'M', 9, 0, 9, 50);;
insert into time_slot values ('B', 'W', 9, 0, 9, 50);;
insert into time_slot values ('B', 'F', 9, 0, 9, 50);;
insert into time_slot values ('C', 'M', 11, 0, 11, 50);;
insert into time_slot values ('C', 'W', 11, 0, 11, 50);;
insert into time_slot values ('C', 'F', 11, 0, 11, 50);;
insert into time_slot values ('D', 'M', 13, 0, 13, 50);;
insert into time_slot values ('D', 'W', 13, 0, 13, 50);;
insert into time_slot values ('D', 'F', 13, 0, 13, 50);;
insert into time_slot values ('E', 'T', 10, 30, 11, 45);;
insert into time_slot values ('E', 'R', 10, 30, 11, 45);;
insert into time_slot values ('F', 'T', 14, 30, 15, 45);;
insert into time_slot values ('F', 'R', 14, 30, 15, 45);;
insert into time_slot values ('G', 'M', 16, 0, 16, 50);;
insert into time_slot values ('G', 'W', 16, 0, 16, 50);;
insert into time_slot values ('G', 'F', 16, 0, 16, 50);;
insert into time_slot values ('H', 'W', 10, 0, 12, 30);;
insert into prereq values ('BIO-301', 'BIO-101');;
insert into prereq values ('BIO-399', 'BIO-101');;
insert into prereq values ('CS-190', 'CS-101');;
insert into prereq values ('CS-315', 'CS-101');;
insert into prereq values ('CS-319', 'CS-101');;
insert into prereq values ('CS-347', 'CS-101');;
insert into prereq values ('EE-181', 'PHY-101');;
;
# DML test;
;
select * from instructor where dept_name = 'Comp. Sci.';
;
## Where条件支持and or。;
select name, dept_name, salary from instructor where dept_name = 'Comp. Sci.' and salary > 70000 and salary < 80000;
select id, name, year from student natural join takes where year >= 2010;
select * from student natural join takes natural join course where course.dept_name = 'Comp. Sci.';
;
## 实现三张表以上的Join。;
select student.name, takes.year, course.title from student natural join takes natural join course where course.dept_name = 'Comp. Sci.' and course.credits >= 4.0;
;
## show table;
show table prereq;
;
;
exit;