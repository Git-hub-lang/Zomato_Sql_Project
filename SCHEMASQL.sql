-- Zomato data Analysis using SQL.
 DROP TABLE IF EXISTS orders;
 DROP TABLE IF EXISTS customers;
 DROP TABLE IF EXISTS restraunts;
 DROP TABLE IF EXISTS rides;
 DROP TABLE IF EXISTS deliveries;

	 
CREATE TABLE customers
(customer_id INT PRIMARY KEY,
customer_name VARCHAR(25),
reg_date DATE);

CREATE TABLE restraunts
(
restraunt_id INT PRIMARY KEY,
restraunt_name VARCHAR(55),
city VARCHAR(15),
opening_hours VARCHAR(55)
);

CREATE TABLE orders
(
order_id INT PRIMARY KEY,
customer_id INT, -- From customers table
restraunt_id INT, -- From restraunts table
order_item  VARCHAR(55),
order_date DATE,
order_time TIME,
order_status VARCHAR(25),
total_amount FLOAT
);
-- Adding FK Constraints
ALTER TABLE orders
ADD CONSTRAINT fk_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_restraunts
FOREIGN KEY (restraunt_id)
REFERENCES restraunts(restraunt_id);


CREATE TABLE riders
(
rider_id INT PRIMARY KEY,
rider_name VARCHAR(55),
sign_up DATE
);


CREATE TABLE deliveries
(
delivery_id INT PRIMARY KEY,
order_id INT, -- From order table
delivery_status VARCHAR(35),
delivery_time TIME,
rider_id INT, -- From riders table
CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT fk_riders FOREIGN KEY (rider_id) REFERENCES riders(rider_id)
);
