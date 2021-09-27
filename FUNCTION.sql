#create a database Customers
create database Customers;
use Customers;
#Create a table customer_details and insert the values cust_id,name,occupation,age
create table customer_details(cust_id int primary key,name varchar(20),occupation varchar(20),age int);
insert into customer_details(cust_id,name,occupation,age) values(101,'Peter','Engineer',32);
insert into customer_details(cust_id,name,occupation,age) values(102,'Joseph','Developer',30);
insert into customer_details(cust_id,name,occupation,age) values(103,'John','Leader',28);
insert into customer_details(cust_id,name,occupation,age) values(104,'Stephen','Scientist',45);
insert into customer_details(cust_id,name,occupation,age) values(105,'Suzi','Carpenter',26);
insert into customer_details(cust_id,name,occupation,age) values(106,'Bob','Actor',25);
select * from customer_details;

#create a function that returns the customer occupation based on the age using the below statement.
DELIMITER $$  
CREATE FUNCTION Customer_Occupation(  
    age int  
)   
RETURNS VARCHAR(20)  
DETERMINISTIC  
BEGIN  
    DECLARE customer_occupation VARCHAR(20);  
    IF age > 35 THEN  
        SET customer_occupation = 'Scientist';  
    ELSEIF (age <= 35 AND   
            age >= 30) THEN  
        SET customer_occupation = 'Engineer';  
    ELSEIF age < 30 THEN  
        SET customer_occupation = 'Actor';  
    END IF;  
    -- return the customer occupation  
    RETURN (customer_occupation);  
END$$  
DELIMITER ;

#see all stored functions available in the current database using the following statement:
show function status where db='Customers';

#stored function is called with the SQL statement. The following statement uses customer_occupation stored function to get the result
select name,age,Customer_Occupation(age) from customer_details ORDER BY age;

#Stored function call in procedure.This statement creates a procedure in a database that uses Customer_Occupation() stored function.
DELIMITER $$  
create PROCEDURE GetCustomerDetail()  
BEGIN  
    select name, age, Customer_Occupation(age) from customer_details ORDER BY age;  
END$$  
DELIMITER ;
#The below statement can be used to call the stored procedure:
call GetCustomerDetail();  


