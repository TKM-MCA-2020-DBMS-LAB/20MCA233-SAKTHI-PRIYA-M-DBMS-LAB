#Create a database Organization
create database organization;
use Organization;

#Create two tables department,employee
create table department(dept_no int primary key,dept_name varchar(20),location varchar(30));
create table employee(emp_no int primary key,emp_name varchar(20) not null,DOB date,address varchar(30),date_of_join date,mobile_no bigint,dept_no int,foreign key(dept_no) references department(dept_no),designation varchar(20),salary float);

#(i)Add 5 rows in the employee and department tables
#(ii)Display all the records from the above tables
insert into department values(101,"A","first floor");
insert into department values(102,"B","second floor");
insert into department values(103,"C","third floor");
insert into department values(104,"D","first floor");
insert into department values(105,"E","second floor");
select * from department;

insert into employee values(1,"Raajitha",'1996-04-20',"Nadathattumal house",'2020-01-10',9785439910,101,"Manager",20000);
insert into employee values(2,"Nandana",'2000-05-23',"Nandanam house",'2020-02-11',7012349019,102,"Analyst",8000);
insert into employee values(3,"Aswathi",'1995-06-29',"Kavila house",'2021-01-14',9912120010,103,"Analyst",10000);
insert into employee values(4,"Nithya",'1994-01-18',"Nithyam house",'2021-05-24',8890127340,104,"Clerk",10000);
insert into employee values(5,"Arya",'1999-10-19',"Aryan house",'2021-03-20',7520117041,105,"Salesman",7000);
select * from employee;

#(iii)	Display the empno and name of all the employees from department no 102
select emp_no,emp_name from employee where dept_no=102;

#(iv)Display empno,name,designation,dept no and salary in the descending order of salary
select emp_no,emp_name,designation,dept_no,salary from employee order by salary desc;

#(v)Display the empno and name of all employees whose salary is between 5000 and 9000
select emp_no,emp_name from employee where salary between 5000 and 9000;

#(vi)Display all designations without duplicate values.
select distinct designation  from employee;

#(vii)	Display the dept name and total salary of employees of each department.
select dept_no,sum(salary) from employee group by dept_no;

#(viii)	Change the salary of employees to 25000 whose designation is ‘Manager’
update employee set salary=25000 where designation="Manager";

#(ix)Change the mobile no of employee named ‘Nithya’
update employee set mobile_no=7210894310 where emp_name="Nithya";

#(x)Delete all employees whose salaries are equal to Rs.7000
delete from employee where salary=7000;

#(xi)Select the department that has total salary paid for its employees more than 9000
select dept_no,sum(salary) from employee group by dept_no having sum(salary)>9000;

