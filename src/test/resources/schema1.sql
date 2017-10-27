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
  PRIMARY KEY  (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id)
)

