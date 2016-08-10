-- DEFINE YOUR DATABASE SCHEMA HERE
CREATE table employees(
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255) PRIMARY KEY
);

CREATE table customers(
  name VARCHAR(255),
  customer_number TEXT PRIMARY KEY
);

CREATE table products(
  name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE sales(
  employee_id VARCHAR(255) REFERENCES employees(email),
  customer_id TEXT REFERENCES customers(customer_number),
  product_id VARCHAR(255) REFERENCES products(name),
  sale_date DATE,
  sale_amount TEXT,
  units_sold INT,
  invoice_no INT,
  invoice_frequency TEXT
);
