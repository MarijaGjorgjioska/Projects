CREATE TABLE brands (
bid int NOT NULL , bname varchar(50));
ALTER TABLE brands 
ADD primary key (bid);

CREATE TABLE inv_user(
user_id varchar(50)NOT NULL,
name varchar (50),
password varchar(50),
last_login date,
user_type varchar(50));

--DROP TABLE inv_user

CREATE TABLE categories( 
cid int NOT NULL,
category_name varchar(20));

ALTER TABLE categories 
ADD primary key (cid);

ALTER TABLE inv_user
ADD primary key(user_id);

CREATE TABLE product(
pid int NOT NULL primary key,
cid int NOT NULL references categories (cid),
bid int NOT NULL references brands (bid),
sid int NOT NULL,
pname varchar(50),
p_stock int NOT NULL,
price int NOT NULL,
added_date date);


CREATE TABLE stores (
sid int NOT NULL,
sname varchar(50),
address varchar(50),
mobno int NOT NULL);


ALTER TABLE stores 
ADD primary key (sid);

INSERT INTO stores (sid,sname,address,mobno)
VALUES ('1','Saturn','Olimpya','10')

ALTER TABLE product 
ADD foreign key (sid) references stores (sid);

CREATE TABLE provides(
bid int NOT NULL references brands(bid),
sid int NOT NULL references stores(sid),
discount int NOT NULL);

CREATE TABLE customer_cart(
cust_id int NOT NULL primary key,
name varchar(50),
mobno int NOT NULL);

CREATE TABLE select_product(
cust_id int NOT NULL references customer_cart(cust_id),
pid int NOT NULL references product(pid),
quantity int NOT NULL);


--two NN
CREATE TABLE transactionn (
id int NOT NULL primary key, 
total_amount int NOT NULL,
paid int, 
due int, 
gst int, 
discount int, 
payment_method varchar(50),
cart_id int NOT NULL references customer_cart(cust_id));

CREATE TABLE invoce(
item_no int NOT NULL,
product_name varchar(50),
quantity int NOT NULL,
net_price int NOT NULL,
transaction_id int NOT NULL references transactionn(id));

--INSERT INTO BRANDS 

INSERT INTO brands( 
bid, bname)
VALUES ('1','Apple')

INSERT INTO brands( 
bid, bname)
VALUES ('2','Samsung')

INSERT INTO brands( 
bid, bname)
VALUES ('3','Nike')

INSERT INTO brands( 
bid, bname)
VALUES ('4','Fortune')

--INSERT INTO inv_user

INSERT INTO inv_user (user_id, name, password, last_login, user_type)
VALUES ('vidit@gmail.com','vidit','1234','2018-10-10','admin')

INSERT INTO inv_user (user_id, name, password, last_login, user_type)
VALUES ('harsh@gmail.com','harsh','1234324','2019-11-23','admin')

INSERT INTO inv_user (user_id, name, password, last_login, user_type)
VALUES ('prashant@gmail.com','prashant','00021836','2023-11-23','accountant')

--INSERT INTO categories

INSERT INTO categories( cid, category_name)
VALUES ('1','Electroincs')

INSERT INTO categories( cid, category_name)
VALUES ('2','Clothing')

INSERT INTO categories( cid, category_name)
VALUES ('3','Grocey')

--INSERT INTO stores 
INSERT INTO stores( sid,sname,address,mobno) 
VALUES ('2','Sara Kupu','Miladinovi','9999')

INSERT INTO stores( sid,sname,address,mobno) 
VALUES ('3','Daria Nikov','Spirovi','999329')

INSERT INTO stores( sid,sname,address,mobno) 
VALUES ('4','Deki Surkov','Brazov','91299329')

--INSERT INTO product

INSERT INTO product ( pid,cid,bid,sid,pname,p_stock,price,added_date)
VALUES ('1','1','1','1','Iphone','4','45000','2021-03-16')

INSERT INTO product ( pid,cid,bid,sid,pname,p_stock,price,added_date)
VALUES ('2','1','1','1','Airpods3','4','1900','2021-03-20')

INSERT INTO product ( pid,cid,bid,sid,pname,p_stock,price,added_date)
VALUES ('3','1','2','1','SmartWatch','3','45000','2021-07-23')

INSERT INTO product ( pid,cid,bid,sid,pname,p_stock,price,added_date)
VALUES ('4','3','4','1','AirMax6','4','45000','2021-09-10')

INSERT INTO product ( pid,cid,bid,sid,pname,p_stock,price,added_date)
VALUES ('5','2','3','1','Refined Oil','2','45000','2021-05-12')

--INSERT INTO provides

INSERT INTO provides (bid,sid,discount)
VALUES ('1','1','12')

INSERT INTO provides (bid,sid,discount)
VALUES ('2','2','7')

INSERT INTO provides (bid,sid,discount)
VALUES ('3','3','15')

INSERT INTO provides (bid,sid,discount)
VALUES ('1','2','7')

INSERT INTO provides (bid,sid,discount)
VALUES ('4','2','19')

INSERT INTO provides (bid,sid,discount)
VALUES ('4','3','20')

--INSERT INTO customer_cart

INSERT INTO customer_cart(cust_id,name,mobno)
VALUES ('1','Mary','3742')

INSERT INTO customer_cart(cust_id,name,mobno)
VALUES ('2','Gary','37442')

INSERT INTO customer_cart(cust_id,name,mobno)
VALUES ('3','Simony','2152')

--INSERT INTO select_product 

INSERT INTO select_product (cust_id,pid,quantity)
VALUES ('1','2','2')

INSERT INTO select_product (cust_id,pid,quantity)
VALUES ('2','2','1')

INSERT INTO select_product (cust_id,pid,quantity)
VALUES ('3','2','12')

--INSERT INTO transactionn

INSERT INTO transactionn (id,total_amount,paid,due,gst,discount,payment_method,cart_id)
VALUES ('1','57000','25000','20000','5000','350','card','1')

INSERT INTO transactionn (id,total_amount,paid,due,gst,discount,payment_method,cart_id)
VALUES ('2','57000','57000','0','570','570','cash','2')

INSERT INTO transactionn (id,total_amount,paid,due,gst,discount,payment_method,cart_id)
VALUES ('3','19000','17000','2000','190','190','cash','3')



SELECT * FROM brands,categories,customer_cart,inv_user,product,provides,select_product,stores,transactionn

SELECT COUNT(Name) 
FROM customer_cart,transactionn
WHERE paid IS NOT NULL


SELECT  pname,
MAX(price) AS maximalPrice
FROM product
GROUP BY pname
ORDER BY maximalPrice DESC

SELECT 
AVG (price) AS average 
FROM product 
ORDER BY average

SELECT pname AS names
FROM product 
GROUP BY pname



























