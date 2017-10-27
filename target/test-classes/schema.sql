/*

Sakila for Microsoft SQL Server is a port of the Sakila example database available for MySQL, which was originally developed by Mike Hillyer of the MySQL AB documentation team. 
This project is designed to help database administrators to decide which database to use for development of new products
The user can run the same SQL against different kind of databases and compare the performance

License: BSD
Copyright DB Software Laboratory
http://www.etl-tools.com

*/

--
-- Table structure for table actor
--



CREATE TABLE actor(
  actor_id int NOT NULL IDENTITY ,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY (actor_id)
  )



--
-- Table structure for table country
--



CREATE TABLE country (
  country_id SMALLINT NOT NULL IDENTITY ,
  country VARCHAR(50) NOT NULL,
  last_update DATETIME,
  PRIMARY KEY  (country_id)
)





--
-- Table structure for table city
--

CREATE TABLE city (
  city_id int NOT NULL IDENTITY ,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (city_id),
  CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES country (country_id) ON DELETE NO ACTION ON UPDATE CASCADE
)


CREATE TABLE address (
  address_id int NOT NULL IDENTITY ,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50)  NULL,
  district VARCHAR(20) NOT NULL,
  city_id INT  NOT NULL,
  postal_code VARCHAR(10)  NULL,
  phone VARCHAR(20) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (address_id)
)


--
-- Table structure for table language
--

CREATE TABLE language (
  language_id TINYINT NOT NULL IDENTITY,
  name CHAR(20) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (language_id)
)

CREATE TABLE catery (
  catery_id TINYINT NOT NULL IDENTITY,
  name VARCHAR(25) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (catery_id)
)

/*
 ALTER TABLE catery ADD CONSTRAINT [DF_catery_last_update]  (getdate()) FOR last_update
*//*


--
-- Table structure for table customer
--

CREATE TABLE customer (
  customer_id INT NOT NULL IDENTITY ,
  store_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50)  NULL,
  address_id INT NOT NULL,
  active CHAR(1) NOT NULL  'Y',
  create_date DATETIME NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
*/
/*
 ALTER TABLE customer ADD CONSTRAINT [DF_customer_last_update]  (getdate()) FOR last_update

 ALTER TABLE customer ADD CONSTRAINT [DF_customer_create_date]  (getdate()) FOR create_date

 CREATE  INDEX idx_fk_store_id ON customer(store_id) 

 CREATE  INDEX idx_fk_address_id ON customer(address_id) 

 CREATE  INDEX idx_last_name ON customer(last_name) 
*//*


--
-- Table structure for table film
--

CREATE TABLE film (
  film_id int NOT NULL IDENTITY ,
  title VARCHAR(255) NOT NULL,
  description TEXT  NULL,
  release_year VARCHAR(4) NULL,
  language_id TINYINT NOT NULL,
  original_language_id TINYINT  NULL,
  rental_duration TINYINT NOT NULL  3,
  rental_rate DECIMAL(4,2) NOT NULL  4.99,
  length SMALLINT  NULL,
  replacement_cost DECIMAL(5,2) NOT NULL  19.99,
  rating VARCHAR(10)  'G',
  special_features VARCHAR(255)  NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (film_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) 
)

*/
/*ALTER TABLE film ADD CONSTRAINT CHECK_special_features CHECK(special_features is null or
                                                              special_features like '%Trailers%' or 
                                                              special_features like '%Commentaries%' or 
                                                              special_features like '%Deleted Scenes%' or 
                                                              special_features like '%Behind the Scenes%')

ALTER TABLE film ADD CONSTRAINT CHECK_special_rating CHECK(rating in ('G','PG','PG-13','R','NC-17'))

ALTER TABLE film ADD CONSTRAINT [DF_film_last_update]  (getdate()) FOR last_update

CREATE  INDEX idx_fk_language_id ON film(language_id) 

CREATE  INDEX idx_fk_original_language_id ON film(original_language_id) 
*//*



--
-- Table structure for table film_actor
--

CREATE TABLE film_actor (
  actor_id INT NOT NULL,
  film_id  INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (actor_id,film_id),
  CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
*/
/*
 ALTER TABLE film_actor ADD CONSTRAINT [DF_film_actor_last_update]  (getdate()) FOR last_update

 CREATE  INDEX idx_fk_film_actor_film ON film_actor(film_id) 

 CREATE  INDEX idx_fk_film_actor_actor ON film_actor(actor_id) 
*//*


--
-- Table structure for table film_catery
--

CREATE TABLE film_catery (
  film_id INT NOT NULL,
  catery_id TINYINT  NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (film_id, catery_id),
  CONSTRAINT fk_film_catery_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_catery_catery FOREIGN KEY (catery_id) REFERENCES catery (catery_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
*/
/*
 ALTER TABLE film_catery ADD CONSTRAINT [DF_film_catery_last_update]  (getdate()) FOR last_update

 CREATE  INDEX idx_fk_film_catery_film ON film_catery(film_id) 

 CREATE  INDEX idx_fk_film_catery_catery ON film_catery(catery_id) 
*//*

--
-- Table structure for table film_text
--

CREATE TABLE film_text (
  film_id SMALLINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  PRIMARY KEY NONCLUSTERED (film_id),
)

--
-- Table structure for table inventory
--

CREATE TABLE inventory (
  inventory_id INT NOT NULL IDENTITY,
  film_id INT NOT NULL,
  store_id INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (inventory_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
*/
/*
 ALTER TABLE inventory ADD CONSTRAINT [DF_inventory_last_update]  (getdate()) FOR last_update

 CREATE  INDEX idx_fk_film_id ON inventory(film_id) 

 CREATE  INDEX idx_fk_film_id_store_id ON inventory(store_id,film_id) 
*//*


--
-- Table structure for table staff
--
*/
CREATE TABLE staff (
  staff_id TINYINT NOT NULL IDENTITY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  address_id INT NOT NULL,
  email VARCHAR(50)  NULL,
  store_id INT NOT NULL,
  active BIT NOT NULL  1,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(40)  NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (staff_id),
  CONSTRAINT fk_staff_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE NO ACTION ON UPDATE CASCADE
)

/*
 ALTER TABLE staff ADD CONSTRAINT [DF_staff_last_update]  (getdate()) FOR last_update

 CREATE  INDEX idx_fk_store_id ON staff(store_id) 

 CREATE  INDEX idx_fk_address_id ON staff(address_id) 
*//*


--
-- Table structure for table store
--
*/
CREATE TABLE store (
  store_id INT NOT NULL IDENTITY,
  manager_staff_id TINYINT NOT NULL,
  address_id INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (store_id),
  CONSTRAINT fk_store_staff FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id) ,
  CONSTRAINT fk_store_address FOREIGN KEY (address_id) REFERENCES address (address_id) 
)


/*
 ALTER TABLE store ADD CONSTRAINT [DF_store_last_update]  (getdate()) FOR last_update

 CREATE UNIQUE NONCLUSTERED INDEX idx_fk_address_id ON store(manager_staff_id) 

 CREATE  INDEX idx_fk_store_address ON store(address_id) 
*//*


*/
--
-- Table structure for table payment
--

CREATE TABLE payment (
  payment_id int NOT NULL IDENTITY ,
  customer_id INT  NOT NULL,
  staff_id TINYINT NOT NULL,
  rental_id INT  NULL,
  amount DECIMAL(5,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (payment_id),
  CONSTRAINT fk_payment_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ,
  CONSTRAINT fk_payment_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id) 
)

/*
 ALTER TABLE payment ADD CONSTRAINT [DF_payment_last_update]  (getdate()) FOR last_update

 CREATE  INDEX idx_fk_staff_id ON payment(staff_id) 

 CREATE  INDEX idx_fk_customer_id ON payment(customer_id) 
*//*


--
-- Table structure for table rental
--
*/
CREATE TABLE rental (
  rental_id INT NOT NULL IDENTITY,
  rental_date DATETIME NOT NULL,
  inventory_id INT  NOT NULL,
  customer_id INT  NOT NULL,
  return_date DATETIME  NULL,
  staff_id TINYINT  NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (rental_id),
  CONSTRAINT fk_rental_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ,
  CONSTRAINT fk_rental_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id) ,
  CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) 
)

/*
 ALTER TABLE rental ADD CONSTRAINT [DF_rental_last_update]  (getdate()) FOR last_update

 CREATE INDEX idx_fk_inventory_id ON rental(inventory_id) 

 CREATE INDEX idx_fk_customer_id ON rental(customer_id) 

 CREATE INDEX idx_fk_staff_id ON rental(staff_id) 

 CREATE UNIQUE INDEX   idx_uq  ON rental (rental_date,inventory_id,customer_id)
*//*


-- FK CONSTRAINTS
*/
/*ALTER TABLE customer ADD CONSTRAINT fk_customer_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE NO ACTION ON UPDATE CASCADE

ALTER TABLE inventory ADD CONSTRAINT fk_inventory_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE staff ADD CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE payment ADD CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE SET NULL ON UPDATE CASCADE;
*//*


--
-- View structure for view customer_list
--


-- View structure for view film_list
--


--
*/
