create database College;
use college;
#(i)	Create the tables:
#Student (sid, sname, sex, dob,dno) Department (dno, dname)
#Faculty (F_id, fname, designation, salary,dno) Course (cid, cname, credits,dno)
#Register (sid,cid,sem ) Teaching (f_id,cid,sem) Hostel(hid,hname,seats,)

#(ii)	Include the necessary constraints NOT NULL, DEFAULT, CHECK, and PRIMARY KEY, UNIQUE.


create table Department(dno int primary key,danme varchar(20));
create table Student(sid int primary key,sname varchar(20),sex varchar(20),dob date,dno int,foreign key(dno) references Department(dno));
create table Faculty(F_id int primary key,fname varchar(20) not null,designation varchar(20),salary int,dno int,foreign key(dno) references Department(dno));
create table Course(cid int primary key,cname varchar(20),credits int,dno int,foreign key(dno) references Department(dno));
create table Register(sid int,foreign key(sid) references Student(sid),cid int,foreign key(cid) references Course(cid),sem varchar(20));
create table Teaching(F_id int,foreign key(F_id) references Faculty(F_id),cid int,foreign key(cid) references Course(cid),sem varchar(20)); 
create table Hostel(hid int primary key,hname varchar(20),seat int);

insert into Department(dno,danme) values(120,'CS');
insert into Department(dno,danme) values(136,'MECH');
insert into Department(dno,danme) values(221,'CIVIL');
insert into Department(dno,danme) values(389,'MCA');
insert into Department(dno,danme) values(110,'MBA');
select * from Department;

insert into Student(sid,sname,sex,dob,dno) values(1,'Rani','F','1999-04-23',221);
insert into Student(sid,sname,sex,dob,dno) values(2,'Raju','M','1998-01-16',136);
insert into Student(sid,sname,sex,dob,dno) values(3,'Manu','M','2000-06-20',110);
insert into Student(sid,sname,sex,dob,dno) values(4,'Nithya','F','1997-02-02',389);
insert into Student(sid,sname,sex,dob,dno) values(5,'Anu','F','1999-10-17',120);
select * from Student;

insert into Faculty(F_id,fname,designation,salary,dno) values(101,'Rajesh','Professor',40000,136);
insert into Faculty(F_id,fname,designation,salary,dno) values(125,'Sangeetha','Professor',30000,221);
insert into Faculty(F_id,fname,designation,salary,dno) values(259,'Sheema','Guest-lecture',25000,389);
insert into Faculty(F_id,fname,designation,salary,dno) values(480,'Adithyan','lab-staff',20000,120);
insert into Faculty(F_id,fname,designation,salary,dno) values(500,'Mathew','Professor',50000,110);
select * from Faculty;

insert into Course(cid,cname,credits,dno) values(1001,'MECH',7,136);
insert into Course(cid,cname,credits,dno) values(1002,'CIVIL',5,221);
insert into Course(cid,cname,credits,dno) values(1003,'CS',6,120);
insert into Course(cid,cname,credits,dno) values(1004,'MCA',5,389);
insert into Course(cid,cname,credits,dno) values(1005,'MBA',4,110);
select * from Course;

insert into Register(sid,cid,sem) values(2,1001,'I');
insert into Register(sid,cid,sem) values(4,1003,'III');
insert into Register(sid,cid,sem) values(1,1005,'IV');
insert into Register(sid,cid,sem) values(3,1004,'V');
insert into Register(sid,cid,sem) values(5,1002,'II');
select * from Register;

insert into Teaching(F_id,cid,sem) values(259,1004,'V');
insert into Teaching(F_id,cid,sem) values(480,1003,'III');
insert into Teaching(F_id,cid,sem) values(500,1005,'IV');
insert into Teaching(F_id,cid,sem) values(125,1002,'II');
insert into Teaching(F_id,cid,sem) values(101,1001,'I');
select * from Teaching;

insert into Hostel(hid,hname,seat) values(2001,'MODERN',100);
insert into Hostel(hid,hname,seat) values(2002,'TKMCEHOSTEL',250);
insert into Hostel(hid,hname,seat) values(2003,'FLAT',150);
insert into Hostel(hid,hname,seat) values(2004,'VIDYAHOSTEL',200);
insert into Hostel(hid,hname,seat) values(2005,'INTERNATIONAL_HOSTEL',500);
select * from Hostel;

#(iii)	List the details of students in the ascending order of date of birth
select * from Student order by dob desc;

#(iv)	Display the details of students from MECH
select * from Student where dno=136;

#(v)	List the faculties in the descending order of salary
select * from Faculty order by salary desc;

#(vi)	Display the total number of students in each department
select dno,count(*)Student from Student group by dno;

#(vii)	Display the total number of faculties in each department with salary greater than 25000
select fname from Faculty where salary >25000;














 


