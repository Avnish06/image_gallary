CREATE TABLE Customer (
id INT PRIMARY KEY,
cname VARCHAR(225),
address VARCHAR(225),
gender CHAR(2),
city VARCHAR(225),
pincode INT 
);

-- INSERT

INSERT INTO customer(id, cname, address, gender, city, pincode)
VALUES
 (121, 'Ram Kumar', 'moradabad', 'M', 'Pakbada', 244001),
(122, 'Shyam Kumar', 'motihari', 'M', 'hawai adda', 244032),
(123, 'Sita Mayya', 'Ayodhhya', 'F', 'ram nagar' , 244091);

INSERT INTO customer(id, cname)
 VALUES (120, 'ANOIIK RAJ');

Select * from Customer;

-- UPDATE

UPDATE Customer SET ADDRESS = 'MUMBAI', GENDER = 'M', CITY = 'BHAIRAV ASTHAN', PINCODE = 231098 WHERE ID = 120;

-- UPDATE MULTIPLE ROWS

SET SQL_SAFE_UPDATES = 0;

UPDATE Customer SET Pincode = 231098;

UPDATE Customer SET Pincode = Pincode + 1;

-- DELETE 

DELETE FROM Customer WHERE id = 123;

SELECT * FROM Customer;

REPLACE INTO Customer (id, 'cname')
VALUES (121,'motihari');

















