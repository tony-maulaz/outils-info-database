-- Create tables
DROP SCHEMA IF EXISTS orders CASCADE;
CREATE SCHEMA orders;
SET SCHEMA 'orders';
CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    number VARCHAR(255),
    order_date DATE,
    supplier_id INTEGER,
    amount DECIMAL(10, 2),
    validated BOOLEAN
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    ref VARCHAR(255),
    price REAL,
    order_id INTEGER
);

INSERT INTO suppliers (name)
VALUES ('Supplier 1');
INSERT INTO suppliers (name)
VALUES ('Supplier 2');
INSERT INTO suppliers (name)
VALUES ('Supplier 3');
INSERT INTO suppliers (name)
VALUES ('Supplier 4');
INSERT INTO suppliers (name)
VALUES ('Supplier 5');
INSERT INTO orders (number, order_date, supplier_id, amount)
VALUES ('Order 1', '2018-01-01', 1, 100.00);
INSERT INTO orders (number, order_date, supplier_id, amount)
VALUES ('Order 2', '2018-01-02', 2, 200.00);
INSERT INTO orders (number, order_date, supplier_id, amount)
VALUES ('Order 3', '2018-01-03', 3, 300.00);
INSERT INTO orders (number, order_date, supplier_id, amount)
VALUES ('Order 4', '2018-01-04', 4, 400.00);
INSERT INTO orders (number, order_date, supplier_id, amount)
VALUES ('Order 5', '2019-01-04', 1, 400.00);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 1', 10.10, 1);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 2', 10.20, 1);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 3', 10.30, 1);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 4', 10.40, 1);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 20', 20.10, 2);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 21', 20.20, 2);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 22', 20.30, 2);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 30', 30.10, 3);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 50', 50.10, 5);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 52', 50.20, 5);
INSERT INTO items (ref, price, order_id)
VALUES ('Item 53', 50.30, 5);
