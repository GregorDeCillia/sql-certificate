CREATE DATABASE bikes;

CREATE TABLE bikes();
ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;
ALTER TABLE BIKES ADD COLUMN type VARCHAR(50) NOT NULL;
ALTER TABLE bikes ADD COLUMN size INT NOT NULL;
ALTER TABLE bikes ADD COLUMN available boolean NOT NULL DEFAULT TRUE;

CREATE TABLE customers();
ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;
ALTER TABLE customers ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;
ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;

CREATE TABLE rentals();
ALTER TABLE rentals ADD COLUMN rental_id SERIAL PRIMARY KEY;
ALTER TABLE rentals ADD COLUMN customer_id INT REFERENCES customers(customer_id) NOT NULL;
ALTER TABLE rentals ADD COLUMN bike_id INT NOT NULL;
ALTER TABLE rentals ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id);
ALTER TABLE rentals ADD COLUMN date_rented DATE NOT NULL DEFAULT NOW();
ALTER TABLE rentals ADD COLUMN date_returned DATE;

INSERT INTO bikes(type, size) VALUES('Mountain', 27);
INSERT INTO bikes(type, size) VALUES('Mountain', 28);
INSERT INTO bikes(type, size) VALUES('Mountain', 29);
INSERT INTO bikes(type, size) VALUES('Road', 27);
INSERT INTO bikes(type, size) VALUES('Road', 28),('Road', 29);
INSERT INTO bikes(type, size) VALUES('BMX', 19),('BMX', 20),('BMX',21);
