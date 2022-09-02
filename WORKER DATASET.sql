# CREATE DATABASE:-
CREATE DATABASE ORG;

#VIEW DATABASES:-
SHOW DATABASES;

#USE CREATED DATABASES:-
USE ORG;

#SHOW ALL TABLES IN A DATABASE:-
show tables;

#CREATE TABLE OF WORKER:-
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

#SHOW TABLES:-
show tables;

#SHOW COLUMNS OF WORKER TABLE:-
show columns from worker;

#DATA INSERT INTO WORKER TABLE:-
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

#SHOW WORKER TABLE:-
select * from worker;

#CREATE BONUS TABLE OF WORLERS:-
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

#INSERT DATA INTO BONUS TABLE:-
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
        
#CREATE TITLE TABLE:-
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

#INSERT DATA INTO TITLE TABLE:-
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');




                            
                            
#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select * from worker;
select first_name as worker_name from worker;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select * from worker;
select upper(first_name) as worker_name from worker;


#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker;

#Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select * from worker;
select substring(first_name,1,3) from worker;


#Q-5. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select first_name from worker;
select rtrim(first_name) from worker;


#Q-6. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(department) from worker;


#Q-7. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select * from worker;
select replace(first_name,'A','a') from worker;


#Q-8. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name,' ',last_name) as full_name from worker;


#Q-9. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name;


#Q-10. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc, department desc;


#Q-11. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker;
select * from worker where first_name in ('vipul','satish');


#Q-12. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('vipul','satish');


#Q-13. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department = 'admin';


#Q-14. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name like "%a%";


#Q-15. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name like "%a";


#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name like "%h" and length(first_name)>=6;


#Q-17. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;


#Q-18. Write an SQL query to print details of the Workers who have joined in Feb’2014
select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;


#Q-19. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker where department = "admin";


#Q-20. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select * from worker where salary<=100000 or salary>=500000;


#Q-21. Write an SQL query to fetch the no. of workers for each department in the descending order.
select * from worker;
select count(worker_id) ,department from worker group by department order by count(worker_id) desc;


#Q-22. Write an SQL query to print details of the Workers who are also Managers.
select w.first_name,w.department,t.worker_title
from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'manager';


#Q-23. Write an SQL query to show only odd rows from a table.
select * from worker where mod(worker_id,2)<>0;


#Q-24. Write an SQL query to show only even rows from a table.
select * from worker where mod(worker_id,2)=0;


#Q-25. Write an SQL query to clone a new table from another table.
create table workerclone like worker;
select * from workerclone;


#Q-26. Write an SQL query to fetch intersecting records of two tables.
SELECT * FROM Worker 
where worker_id in (select * from workerclone);


#Q-27. Write an SQL query to show records from one table that another table does not have.
select w.worker_id from worker as w
left join title as t on w.worker_id = t.worker_ref_id
where t.worker_ref_id is null;


#Q-28. Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 10;


#Q-29. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 5;


#Q-30. Write an SQL query to determine the 5th highest salary.
SELECT *
FROM Worker W1
WHERE 5 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );


#Q-31. Write an SQL query to fetch the list of employees with the same salary.
select w.first_name,w.salary from worker w , worker w1 where w.salary = w1.salary and w.worker_id <> w1.worker_id;


#Q-32. Write an SQL query to show the second highest salary from a table.
select max(salary) from worker where salary not in (select max(salary) from worker);


#Q-33. Write an SQL query to show the second lowest salary from a table.
select min(salary) from worker where salary not in (select min(salary) from worker); 


#Q-34. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);


#Q-35. Write an SQL query to fetch the departments that have less than three people in it.
select department,count(*) from worker group by department having count(worker_id)<3; 


#Q-36. Write an SQL query to show all departments along with the number of people in there.
select department, count(worker_id) from worker group by department;


#Q-37. Write an SQL query to show the last record from a table.
select * from worker where worker_id = (select max(worker_id) from worker);


#Q-38. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id in (select min(worker_id) from worker);


#Q-39. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name,salary,department from worker group by department having max(salary);


#Q-40. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;


#Q-41 Write an SQL query to fetch data which joining date from 2014-02-20 to 2014-04-11
select * from worker where month(joining_date) >= 02 and day(joining_date) >= 20 or month(joining_date) <= 04 and day(joining_date) <= 11 order by joining_date;


#Q-42 Write an SQL query to print the full name of employees which bonus amount is less then equal to 4000
select concat(w.first_name,' ',w.last_name) as Full_Name, b.bonus_amount 
from worker as w
inner join bonus as b 
on w.worker_id = b.worker_ref_id where b.bonus_amount<=4000;


#Q-43 Write an SQL query to print name of employees and salary who is manager
select w.first_name, w.salary, t.worker_title from worker w join title t on w.worker_id = t.worker_ref_id where t.worker_title = "Manager";


#Q-44 Write an SQL query to print name of employees and bonus amount and title which bonus amount is greater then 4000 and who's executive
select w.first_name, b.bonus_amount, t.worker_title from worker w
join bonus b on w.worker_id = b.worker_ref_id 
join title t on w.worker_id=t.worker_ref_id 
where b.bonus_amount >=4000 and worker_title="Manager"; 


#Q-45. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);