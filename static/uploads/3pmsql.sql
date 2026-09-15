Create database temp;
Use temp;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(255))
;

INSERT INTO student VALUES(001, 'anik');

select * from student;

Create database temp;
Use temp;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(255))
;
create database projectsql;
Query OK, 1 row affected (0.14 sec)

mysql> check constaints are useful to apply specific conditions  on table columns
    ->
    ->
    -> ^C
mysql> create table semp(id int unique key not null, name varchar(20), contact bigint unique key not null);
ERROR 1046 (3D000): No database selected
mysql> use projectsql;
Database changed
mysql> create table semp(id int unique key not null, name varchar(20), contact bigint unique key not null);
Query OK, 0 rows affected (0.28 sec)

mysql> insert into semp values(117, 'kukra',98549859,'rahjh@kngf.com')
    ->
    ->
    -> create table hemp(id int, name varchar(20),lastname varchar(30),age int check(age>60));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'create table hemp(id int, name varchar(20),lastname varchar(30),age int check(ag' at line 4
mysql> create table semp(id int unique key not null, name varchar(20), contact bigint unique key not null,email varchar(30) unique key not null);
ERROR 1050 (42S01): Table 'semp' already exists
mysql> create table temp(id int unique key not null, name varchar(20), contact bigint unique key not null,email varchar(30) unique key not null);
Query OK, 0 rows affected (0.08 sec)

mysql> insert into temp values(117, 'kukra',98549859,'rahjh@kngf.com')
    -> insert into temp values(117, 'kukra',98549859,'rahjh@kngf.com');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'insert into temp values(117, 'kukra',98549859,'rahjh@kngf.com')' at line 2
mysql> insert into temp values(117, 'kukra',98549859,'raj123@gmail.com');
Query OK, 1 row affected (0.03 sec)

mysql> create table hemp(id int, name varchar(20),lastname varchar(30),age int check(age>60));
Query OK, 0 rows affected (0.05 sec)

mysql> show create table hemp;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                         |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| hemp  | CREATE TABLE `hemp` (
  `id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `age` int DEFAULT NULL,
  CONSTRAINT `hemp_chk_1` CHECK ((`age` > 60))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

mysql> alter table hemp drop check;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table hemp drop check
    -> alter table 'hemp' drop check
    -> alter table 'hemp' drop check;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'alter table 'hemp' drop check
alter table 'hemp' drop check' at line 2
mysql> insert into hemp values(23,'dd','wee',43);
ERROR 3819 (HY000): Check constraint 'hemp_chk_1' is violated.
mysql> alter table 'hemp' drop check 'hemp_chk_1';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''hemp' drop check 'hemp_chk_1'' at line 1
mysql> alter table hemp drop check 'hemp_chk_1';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''hemp_chalter table hemp drop check 'hemp_chk_1';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''hemp_chk_1'' at line 1
mysql> alter table hemp drop check hemp_chk_1;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show create table hemp;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                         |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| hemp  | CREATE TABLE `hemp` (
  `id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> alter table hemp add constraint chk_age check(age>60 and age <80);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show create table hemp;
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                         |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| hemp  | CREATE TABLE `hemp` (
  `id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `age` int DEFAULT NULL,
  CONSTRAINT `chk_age` CHECK (((`age` > 60) and (`age` < 80)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> Create table;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> Create table 'hemp';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''hemp'' at line 1
mysql> desc hemp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| lastname | varchar(30) | YES  |     | NULL    |       |
| age      | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

mysql> drop table hemp;
Query OK, 0 rows affected (0.02 sec)

mysql> create table hemp(id int, name varchar(20),lastname varchar(20),city varchar(20) default 'noida');
Query OK, 0 rows affected (0.03 sec)

mysql> desc hemp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| lastname | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | noida   |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into hemp(id,name,lastname)values(233,'qdd','qwwee');
Query OK, 1 row affected (0.01 sec)

mysql> select * from hemp;
+------+------+----------+-------+
| id   | name | lastname | city  |
+------+------+----------+-------+
|  233 | qdd  | qwwee    | noida |
+------+------+----------+-------+
1 row in set (0.01 sec)

mysql> insert into hemp(id,name,lastname,city)values(233,'qdd','qwwee','meerut');
Query OK, 1 row affected (0.01 sec)

mysql> select * from hemp;
+------+------+----------+--------+
| id   | name | lastname | city   |
+------+------+----------+--------+
|  233 | qdd  | qwwee    | noida  |
|  233 | qdd  | qwwee    | meerut |
+------+------+----------+--------+
2 rows in set (0.00 sec)

mysql> alter table hemp alter column city drop default;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc gemp;
ERROR 1146 (42S02): Table 'projectsql.gemp' doesn't exist
mysql> desc hemp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| lastname | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table hemp alter column lastname set default 'tomar';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc hemp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| lastname | varchar(20) | YES  |     | tomar   |       |
| city     | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    28
Current database: projectsql

ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> use projectsql;
Database changed
mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> drop table hemp;
Query OK, 0 rows affected (0.16 sec)

mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| adbhai             |
| chklamandus        |
| chutiye            |
| gauravsir          |
| information_schema |
| joins              |
| mysql              |
| newschema          |
| org                |
| performance_schema |
| pizzahut           |
| pqw                |
| project3pm         |
| project4pm         |
| projectsql         |
| psv                |
| ramsingh           |
| roborts            |
| sql_joins          |
| test               |
| test5655           |
+--------------------+
21 rows in set (0.06 sec)

mysql> use projectsql;
Database changed
mysql> insert into employees(id,name,lastname,salary,age,dept,percent,taxsalary)values(233,'Gaurav','tomar',455422,34,'Sales',32333,33223);
ERROR 1146 (42S02): Table 'projectsql.employees' doesn't exist
mysql> create table employees(id int, name varchar(20),lastname varchar(30),salary int, age int, dept varchar(20),percent int, taxsalary int);
Query OK, 0 rows affected (0.12 sec)

mysql> insert into employees values(123,'Gaurav','Tomar',4334,22,'Sales',3443,3234);
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees values(232,'Rahul','Singh',4433,34,'IT',3433,3435),(433,'RAVI','Tyagi',43323,94,'Sales',4333,9032),(544,'ASWANI','TOMAR',43324,31,'IT',4544,1000),(120,'VIPIN','MAVI',90443,32,'Sales',32231,59),(500,'SHYAM','GARG',54332,32,'Marketing',4332,80),(143,'HARSH','Verma',45990,32,'Finance',4003,2393),(300,'SACHIN','SINGH',43232,21,'IT',4321,90);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+------+--------+----------+--------+------+-----------+---------+-----------+
| id   | name   | lastname | salary | age  | dept      | percent | taxsalary |
+------+--------+----------+--------+------+-----------+---------+-----------+
|  123 | Gaurav | Tomar    |   4334 |   22 | Sales     |    3443 |      3234 |
|  232 | Rahul  | Singh    |   4433 |   34 | IT        |    3433 |      3435 |
|  433 | RAVI   | Tyagi    |  43323 |   94 | Sales     |    4333 |      9032 |
|  544 | ASWANI | TOMAR    |  43324 |   31 | IT        |    4544 |      1000 |
|  120 | VIPIN  | MAVI     |  90443 |   32 | Sales     |   32231 |        59 |
|  500 | SHYAM  | GARG     |  54332 |   32 | Marketing |    4332 |        80 |
|  143 | HARSH  | Verma    |  45990 |   32 | Finance   |    4003 |      2393 |
|  300 | SACHIN | SINGH    |  43232 |   21 | IT        |    4321 |        90 |
+------+--------+----------+--------+------+-----------+---------+-----------+
8 rows in set (0.01 sec)
       insert into employees values(452,'Manish','NULL',,34,'IT',3433,3435),(323,'Mohit','Singh',43323,94,'Sales',,);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',34,'IT',3433,3435),(323,'Mohit','Singh',43323,94,'Sales',,)' at line 1
mysql> insert into employees values(452,'Manish','NULL',,34,'IT',3433,3435),(323,'Mohit','Singh',43323,94,'Sales');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',34,'IT',3433,3435),(323,'Mohit','Singh',43323,94,'Sales')' at line 1
mysql> insert into employees values(452,'Manish','NULL',34,'IT',3433,3435),(323,'Mohit','Singh',43323,94,'Sales');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into employees values(452,'Manish','NULL',3445,21,'IT',NULL,NULL),(323,'Mohit','Singh',NULL,94,'Sales',NULL,NULL);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employees;
+------+--------+----------+--------+------+-----------+---------+-----------+
| id   | name   | lastname | salary | age  | dept      | percent | taxsalary |
+------+--------+----------+--------+------+-----------+---------+-----------+
|  123 | Gaurav | Tomar    |   4334 |   22 | Sales     |    3443 |      3234 |
|  232 | Rahul  | Singh    |   4433 |   34 | IT        |    3433 |      3435 |
|  433 | RAVI   | Tyagi    |  43323 |   94 | Sales     |    4333 |      9032 |
|  544 | ASWANI | TOMAR    |  43324 |   31 | IT        |    4544 |      1000 |
|  120 | VIPIN  | MAVI     |  90443 |   32 | Sales     |   32231 |        59 |
|  500 | SHYAM  | GARG     |  54332 |   32 | Marketing |    4332 |        80 |
|  143 | HARSH  | Verma    |  45990 |   32 | Finance   |    4003 |      2393 |
|  300 | SACHIN | SINGH    |  43232 |   21 | IT        |    4321 |        90 |
|  452 | Manish | NULL     |   3445 |   21 | IT        |    NULL |      NULL |
|  323 | Mohit  | Singh    |   NULL |   94 | Sales     |    NULL |      NULL |
+------+--------+----------+--------+------+-----------+---------+-----------+
10 rows in set (0.00 sec)

mysql> select * from employees where lastname = 'NULL';
+------+--------+----------+--------+------+------+---------+-----------+
| id   | name   | lastname | salary | age  | dept | percent | taxsalary |
+------+--------+----------+--------+------+------+---------+-----------+
|  452 | Manish | NULL     |   3445 |   21 | IT   |    NULL |      NULL |
+------+--------+----------+--------+------+------+---------+-----------+
1 row in set (0.01 sec)

mysql> select * from employees where lastname is null;
Empty set (0.01 sec)

mysql> insert into employees values(452,'Manish','NULL',3445,21,'IT',NULL,NULL),(323,'Mohit','Singh',NULL,94,'Sales',);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> ^C
mysql> select * from employees;
+------+--------+----------+--------+------+-----------+---------+-----------+
| id   | name   | lastname | salary | age  | dept      | percent | taxsalary |
+------+--------+----------+--------+------+-----------+---------+-----------+
|  123 | Gaurav | Tomar    |   4334 |   22 | Sales     |    3443 |      3234 |
|  232 | Rahul  | Singh    |   4433 |   34 | IT        |    3433 |      3435 |
|  433 | RAVI   | Tyagi    |  43323 |   94 | Sales     |    4333 |      9032 |
|  544 | ASWANI | TOMAR    |  43324 |   31 | IT        |    4544 |      1000 |
|  120 | VIPIN  | MAVI     |  90443 |   32 | Sales     |   32231 |        59 |
|  500 | SHYAM  | GARG     |  54332 |   32 | Marketing |    4332 |        80 |
|  143 | HARSH  | Verma    |  45990 |   32 | Finance   |    4003 |      2393 |
|  300 | SACHIN | SINGH    |  43232 |   21 | IT        |    4321 |        90 |
|  452 | Manish | NULL     |   3445 |   21 | IT        |    NULL |      NULL |
|  323 | Mohit  | Singh    |   NULL |   94 | Sales     |    NULL |      NULL |
+------+--------+----------+--------+------+-----------+---------+-----------+
10 rows in set (0.00 sec)

mysql> select * from employees where lastname is null;
Empty set (0.00 sec)

mysql> select * from employees where lastname is NULL;
Empty set (0.00 sec)

mysql> alter table employees set lastname = NULL where id = 452;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set lastname = NULL where id = 452' at line 1
mysql> update employees set lastname = NULL where id = 452;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employees where lastname is NULL;
+------+--------+----------+--------+------+------+---------+-----------+
| id   | name   | lastname | salary | age  | dept | percent | taxsalary |
+------+--------+----------+--------+------+------+---------+-----------+
|  452 | Manish | NULL     |   3445 |   21 | IT   |    NULL |      NULL |
+------+--------+----------+--------+------+------+---------+-----------+
1 row in set (0.00 sec)

mysql> select * from employees where lastname is not NULL;
+------+--------+----------+--------+------+-----------+---------+-----------+
| id   | name   | lastname | salary | age  | dept      | percent | taxsalary |
+------+--------+----------+--------+------+-----------+---------+-----------+
|  123 | Gaurav | Tomar    |   4334 |   22 | Sales     |    3443 |      3234 |
|  232 | Rahul  | Singh    |   4433 |   34 | IT        |    3433 |      3435 |
|  433 | RAVI   | Tyagi    |  43323 |   94 | Sales     |    4333 |      9032 |
|  544 | ASWANI | TOMAR    |  43324 |   31 | IT        |    4544 |      1000 |
|  120 | VIPIN  | MAVI     |  90443 |   32 | Sales     |   32231 |        59 |
|  500 | SHYAM  | GARG     |  54332 |   32 | Marketing |    4332 |        80 |
|  143 | HARSH  | Verma    |  45990 |   32 | Finance   |    4003 |      2393 |
|  300 | SACHIN | SINGH    |  43232 |   21 | IT        |    4321 |        90 |
|  323 | Mohit  | Singh    |   NULL |   94 | Sales     |    NULL |      NULL |
+------+--------+----------+--------+------+-----------+---------+-----------+
9 rows in set (0.00 sec)

mysql> select count(*) from employees;
+----------+
| count(*) |
+----------+
|       10 |
+----------+
1 row in set (0.06 sec)

mysql> select count(lastname) from employees;
+-----------------+
| count(lastname) |
+-----------------+
|               9 |
+-----------------+
1 row in set (0.01 sec)

mysql> select count(*) from employees where lastname is null;
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from employees where lastname is not null;
+----------+
| count(*) |
+----------+
|        9 |
+----------+
1 row in set (0.00 sec)

mysql> select count(lastname) from employees where lastname = 'null';
+-----------------+
| count(lastname) |
+-----------------+
|               0 |
+-----------------+
1 row in set (0.01 sec)

mysql> select * from employees where name is 'ravi';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''ravi'' at line 1
mysql> select * from employees where name is 'RAVI';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''RAVI'' at line 1
mysql> select * from employees where name is 'Ravi';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Ravi'' at line 1
mysql> select * from employees where Name is 'Ravi';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Ravi'' at line 1
mysql> select * from employees where name is 'RAVI';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''RAVI'' at line 1
mysql> select * from employees where name = 'RAVI';
+------+------+----------+--------+------+-------+---------+-----------+
| id   | name | lastname | salary | age  | dept  | percent | taxsalary |
+------+------+----------+--------+------+-------+---------+-----------+
|  433 | RAVI | Tyagi    |  43323 |   94 | Sales |    4333 |      9032 |
+------+------+----------+--------+------+-------+---------+-----------+
1 row in set (0.01 sec)

mysql> ^C
mysql> select lastname from employees;
+----------+
| lastname |
+----------+
| Tomar    |
| Singh    |
| Tyagi    |
| TOMAR    |
| MAVI     |
| GARG     |
| Verma    |
| SINGH    |
| NULL     |
| Singh    |
+----------+
10 rows in set (0.00 sec)

mysql> select count(lastname) from employees;
+-----------------+
| count(lastname) |
+-----------------+
|               9 |
+-----------------+
1 row in set (0.00 sec)

mysql> ^C
mysql> ^C
mysql> create table thar(cid int,name varchar(20),price int,model varchar(30));
Query OK, 0 rows affected (0.15 sec)

mysql> drop table thar;
Query OK, 0 rows affected (0.04 sec)

mysql> create table thar(cid int auto_increment primary key, name varchar(20),price int, model varchar(30));
Query OK, 0 rows affected (0.06 sec)

mysql> desc thar;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| cid   | int         | NO   | PRI | NULL    | auto_increment |
| name  | varchar(20) | YES  |     | NULL    |                |
| price | int         | YES  |     | NULL    |                |
| model | varchar(30) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
4 rows in set (0.07 sec)

mysql> show create table thar;
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                           |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| thar  | CREATE TABLE `thar` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

mysql> insert into thar(name,price,model) values('thar4x4',5444333,2018);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharrox',3000343,2021);
Query OK, 1 row affected (0.01 sec)

;ysql> insert into thar(name,price,model) values('tharww',449933,2026)
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+---------+---------+-------+
| cid | name    | price   | model |
+-----+---------+---------+-------+
|   1 | thar4x4 | 5444333 | 2018  |
|   2 | tharrox | 3000343 | 2021  |
|   3 | tharww  |  449933 | 2026  |
+-----+---------+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into thar(name,price,model) values('thareek',789933,2029);
Query OK, 1 row affected (0.01 sec)

mysql> delete from thar wher cid=4;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cid=4' at line 1
mysql> select * from thar;
+-----+---------+---------+-------+
| cid | name    | price   | model |
+-----+---------+---------+-------+
|   1 | thar4x4 | 5444333 | 2018  |
|   2 | tharrox | 3000343 | 2021  |
|   3 | tharww  |  449933 | 2026  |
|   4 | thareek |  789933 | 2029  |
+-----+---------+---------+-------+
4 rows in set (0.00 sec)

mysql> delete from thar where cid = 4;
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+---------+---------+-------+
| cid | name    | price   | model |
+-----+---------+---------+-------+
|   1 | thar4x4 | 5444333 | 2018  |
|   2 | tharrox | 3000343 | 2021  |
|   3 | tharww  |  449933 | 2026  |
+-----+---------+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into thar(name,price,model) values('thaerish',744933,2029);
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+----------+---------+-------+
| cid | name     | price   | model |
+-----+----------+---------+-------+
|   1 | thar4x4  | 5444333 | 2018  |
|   2 | tharrox  | 3000343 | 2021  |
|   3 | tharww   |  449933 | 2026  |
|   5 | thaerish |  744933 | 2029  |
+-----+----------+---------+-------+
4 rows in set (0.00 sec)

mysql> delete fromthar;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> delete from thar;
Query OK, 4 rows affected (0.01 sec)

mysql> select * from employees;
+------+--------+----------+--------+------+-----------+---------+-----------+
| id   | name   | lastname | salary | age  | dept      | percent | taxsalary |
+------+--------+----------+--------+------+-----------+---------+-----------+
|  123 | Gaurav | Tomar    |   4334 |   22 | Sales     |    3443 |      3234 |
|  232 | Rahul  | Singh    |   4433 |   34 | IT        |    3433 |      3435 |
|  433 | RAVI   | Tyagi    |  43323 |   94 | Sales     |    4333 |      9032 |
|  544 | ASWANI | TOMAR    |  43324 |   31 | IT        |    4544 |      1000 |
|  120 | VIPIN  | MAVI     |  90443 |   32 | Sales     |   32231 |        59 |
|  500 | SHYAM  | GARG     |  54332 |   32 | Marketing |    4332 |        80 |
|  143 | HARSH  | Verma    |  45990 |   32 | Finance   |    4003 |      2393 |
|  300 | SACHIN | SINGH    |  43232 |   21 | IT        |    4321 |        90 |
|  452 | Manish | NULL     |   3445 |   21 | IT        |    NULL |      NULL |
|  323 | Mohit  | Singh    |   NULL |   94 | Sales     |    NULL |      NULL |
+------+--------+----------+--------+------+-----------+---------+-----------+
10 rows in set (0.00 sec)

mysql> select * from thar;
Empty set (0.00 sec)

mysql> insert into thar(name,price,model) values('thareeke',455443,2029);
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+----------+--------+-------+
| cid | name     | price  | model |
+-----+----------+--------+-------+
|   6 | thareeke | 455443 | 2029  |
+-----+----------+--------+-------+
1 row in set (0.00 sec)

mysql> truncate table thar;
Query OK, 0 rows affected (0.06 sec)

mysql> insert into thar(name,price,model) values('tjjjnf',54353,4566);
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+--------+-------+-------+
| cid | name   | price | model |
+-----+--------+-------+-------+
|   1 | tjjjnf | 54353 | 4566  |
+-----+--------+-------+-------+
1 row in set (0.00 sec)

mysql> truncate tale thar;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'thar' at line 1
mysql> truncate table thar;
Query OK, 0 rows affected (0.06 sec)

mysql> insert into thar(cid,name,price,model) values(322,'tjjjnf',54353,4566);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('thaeeris',54223,4566);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+----------+-------+-------+
| cid | name     | price | model |
+-----+----------+-------+-------+
| 322 | tjjjnf   | 54353 | 4566  |
| 323 | thaeeris | 54223 | 4566  |
| 324 | tharroxx | 99223 | 3366  |
+-----+----------+-------+-------+
3 rows in set (0.00 sec)

mysql> truncate table thar;
Query OK, 0 rows affected (0.06 sec)

mysql> SET @@auto_increment_increment = 5;
Query OK, 0 rows affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> insert into thar(name,price,model) values('tharroxx',99223,3366);
Query OK, 1 row affected (0.01 sec)

mysql> select * from thar;
+-----+----------+-------+-------+
| cid | name     | price | model |
+-----+----------+-------+-------+
|   1 | tharroxx | 99223 | 3366  |
|   6 | tharroxx | 99223 | 3366  |
|  11 | tharroxx | 99223 | 3366  |
|  16 | tharroxx | 99223 | 3366  |
|  21 | tharroxx | 99223 | 3366  |
|  26 | tharroxx | 99223 | 3366  |
+-----+----------+-------+-------+
6 rows in set (0.00 sec)

mysql>
INSERT INTO student VALUES(001, 'anik');

select * from student;

