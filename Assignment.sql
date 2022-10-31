create table customers(
customer_ID int,
contry varchar(30),
city varchar(30),
postalcode int
)

insert into customers values(1,'India','Delhi',110004)
insert into customers values(3,'England','London',null)
insert into customers values(22,'Sri Lanka','Kandy',20000)
insert into customers values(15,'Norway','Hamar',0015)
insert into customers values(23,'Spain','Madrid',28001)
insert into customers values(7,'Brazil','Para',66000)
insert into customers values(2,'United States','Texas',76277)
insert into customers values(16,'Switzerland','Geneva',null)
insert into customers values(32,'Russia','Sankt Peterburg',190000)
insert into customers values(26,'France','Paris',75000)
insert into customers values(18,'Italy','Rome',00135)
insert into customers values(4,'Japan','Tokyo',1056014)
insert into customers values(8,'Germany','Berlin',121110)
insert into customers values(12,'United States','Boston',null)
insert into customers values(14,'India','Mumbai',400004)

select * from customers

create table products(
product_id int identity(1,1) primary key,
product_name varchar(30),
price int
)


insert into products values('Geitost',50)
insert into products values('Chai',12)
insert into products values('Pavlova',10)
insert into products values('Tofu',50)
insert into products values('Coffee',20)
insert into products values('Poha',15)
insert into products values('Idli',30)
insert into products values('Dosa',50)
insert into products values('Upama',20)

select * from products


--Write a statement that will select the City column from the Customers table
select city from customers

--Select all the different values from the Country column in the Customers table.
select distinct country from customers

--Select all records where the City column has the value "London
select * from customers where city='London'

--Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customers where city  not in('Berlin')

--Select all records where the CustomerID column has the value 23.
select * from customers where customer_ID=23

--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customers where city='Berlin' and postalcode=121110

--Select all records where the City column has the value 'Berlin' or 'London'.
select * from customers where city in('Berlin','London')

--Select all records from the Customers table, sort the result alphabetically by the column City
select * from customers order by city

--Select all records from the Customers table, sort the result reversed alphabetically by the column City
select * from customers order by city desc

--Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from customers order by country, city

--Select all records from the Customers where the PostalCode column is empty
select * from customers where postalcode is null

--Select all records from the Customers where the PostalCode column is NOT empty.
select * from customers where postalcode is not null

--Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway"
update customers set city='Oslo' where country='Norway'

--Delete all the records from the Customers table where the Country value is 'Norway'
delete from customers where country='Norway'

--Use the MIN function to select the record with the smallest value of the Price column.
select min(price) from products

--Use an SQL function to select the record with the highest value of the Price column.
select max(price) from products

--Use the correct function to return the number of records that have the Price value set to 20
select * from products where price=20

--Use an SQL function to calculate the average price of all products.
select avg(price) as avg_price from products

--Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) as Total_price from  products

--Select all records where the value of the City column starts with the letter "a".
select * from customers where city like 'a%'

--Select all records where the value of the City column ends with the letter "a".
select * from customers where city like '%a'

--Select all records where the value of the City column contains the letter "a".
select * from customers where city like '%a%'

--Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customers where city like 'a%b'

--Select all records where the value of the City column does NOT start with the letter "a".
select * from customers where city not like 'a%'

--Select all records where the second letter of the City is an "a".
select * from customers where city like '_a%'

--Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customers where city like '[ACS]%'

--Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customers where city like '[A-F]%'

--Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customers where city not like '[ACF]%'

--Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from customers where country in('Norway','France')

--Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from customers where country not in('Norway','France')

--Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from products where price between 10 and 20

--Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from products where price not between 10 and 20

--Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from products where product_name between 'Geitost' and 'Pavlova'

--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select customer_ID,country,city,postalcode as Pno from customers

--When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from customers as consumers

--List the number of customers in each country.
select count(country) from customers 

--List the number of customers in each country, ordered by the country with the most customers first.
select count(customer_ID) as cust_count, Country
from customers GROUP BY country order by count(customer_ID) desc

--Write the correct SQL statement to create a new database called testDB.
create database testDB

--Write the correct SQL statement to delete a database named testDB
drop database testDB

--Add a column of type DATE called Birthday in Persons table
alter table person add Birthday Date

--Delete the column Birthday from the Persons table
alter table person drop column Birthday 


