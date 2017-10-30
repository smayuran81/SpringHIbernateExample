CREATE TABLE country (
  country_id SMALLINT NOT NULL IDENTITY ,
  country VARCHAR(50) NOT NULL,
  last_update DATETIME,
  PRIMARY KEY  (country_id)
)

CREATE TABLE city (
  city_id int NOT NULL IDENTITY ,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (city_id),
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

CREATE TABLE customer (
  customer_id INT NOT NULL IDENTITY ,
  store_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50)  NULL,
  address_id INT NOT NULL,
  active CHAR(1) NOT NULL,
  create_date DATETIME NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE staff (
  staff_id TINYINT NOT NULL IDENTITY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  address_id INT NOT NULL,
  email VARCHAR(50)  NULL,
  store_id INT NOT NULL,
  active BIT NOT NULL ,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(40)  NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (staff_id),
  CONSTRAINT fk_staff_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE NO ACTION ON UPDATE CASCADE
)



CREATE TABLE film (
  film_id int NOT NULL IDENTITY ,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255)  NULL,
  release_year VARCHAR(4) NULL,
  language_id TINYINT NOT NULL,
  original_language_id TINYINT  NULL,
  rental_duration TINYINT NOT NULL,
  rental_rate DECIMAL(4,2)  NOT NULL,
  length SMALLINT  NULL,
  replacement_cost DECIMAL(5,2) DEFAULT  4.0 NOT NULL,
  rating VARCHAR(10),
  special_features VARCHAR(255)  NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (film_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id)
)

CREATE TABLE actor(
  actor_id int NOT NULL IDENTITY ,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY (actor_id)
  )


CREATE TABLE film_actor (
  actor_id INT NOT NULL,
  film_id  INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (actor_id,film_id),
  CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)

CREATE TABLE film_text (
  film_id SMALLINT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description  VARCHAR(255),
  PRIMARY KEY  (film_id),
)

CREATE TABLE inventory (
  inventory_id INT NOT NULL IDENTITY,
  film_id INT NOT NULL,
  store_id INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (inventory_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)


CREATE TABLE store (
  store_id INT NOT NULL IDENTITY,
  manager_staff_id TINYINT NOT NULL,
  address_id INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (store_id),
)



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

CREATE TABLE category (
  category_id TINYINT NOT NULL IDENTITY,
  name VARCHAR(25) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (category_id)
)

CREATE TABLE film_category (
  film_id INT NOT NULL,
  category_id TINYINT  NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY  (film_id, category_id),
  CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_category_category FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE NO ACTION ON UPDATE CASCADE
)