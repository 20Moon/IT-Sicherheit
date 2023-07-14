drop database mySQLIDatabase;
CREATE DATABASE mySQLIDatabase;
use mySQLIDatabase;


-- Kunden-Tabelle
CREATE TABLE customers (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  address VARCHAR(200),
  credit_card_number VARCHAR(16),
  password VARCHAR(50)
);

-- Bestellungen-Tabelle
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Spiele-Tabelle
CREATE TABLE games (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2)
);

-- Bestellpositionen-Tabelle
CREATE TABLE order_items (
  id INT PRIMARY KEY,
  order_id INT,
  game_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (game_id) REFERENCES games(id)
);

-- Beispieldatensätze für Kunden-Tabelle
INSERT INTO customers (id, first_name, last_name, email, address, credit_card_number, password)
VALUES
  (1, 'John', 'Doe', 'john.doe@example.com', '123 Main St, City', '1111222233334444', 'pass123'),
  (2, 'Jane', 'Smith', 'jane.smith@example.com', '456 Elm St, City', '5555666677778888', 'password456'),
  (3, 'Maria', 'Garcia', 'maria.garcia@example.com', '789 Oak St, City', '9999888877776666', 'secure789'),
  (4, 'Robert', 'Johnson', 'robert.johnson@example.com', '321 Pine St, City', '3333444455556666', 'password1234'),
  (5, 'Emily', 'Brown', 'emily.brown@example.com', '567 Maple St, City', '7777666655554444', 'brownie678');

-- Beispieldatensätze für Bestellungen-Tabelle
INSERT INTO orders (id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2023-07-01', 99.99),
  (2, 2, '2023-07-02', 49.99),
  (3, 3, '2023-07-03', 69.99),
  (4, 4, '2023-07-04', 89.99),
  (5, 5, '2023-07-05', 109.99);

-- Beispieldatensätze für Spiele-Tabelle
INSERT INTO games (id, name, price)
VALUES
  (1, 'Game 1', 29.99),
  (2, 'Game 2', 39.99),
  (3, 'Game 3', 19.99),
  (4, 'Game 4', 49.99),
  (5, 'Game 5', 59.99);

-- Beispieldatensätze für Bestellpositionen-Tabelle
INSERT INTO order_items (id, order_id, game_id, quantity, price)
VALUES
  (1, 1, 1, 1, 29.99),
  (2, 1, 2, 2, 79.98),
  (3, 2, 2, 1, 39.99),
  (4, 3, 3, 1, 19.99),
  (5, 4, 4, 2, 99.98),
  (6, 5, 5, 1, 59.99);

