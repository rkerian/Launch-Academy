# Use this file to import the sales information into the
# the database.

require "pg"
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

master_array = []
employee_array = []
customer_array = []
product_array = []

CSV.foreach("sales.csv", headers:true) do |row|
  emp_data = row[0].split(' ')
  emp_data[2].delete!("()")
  employee_array << emp_data
  cust_data = row[1].split(' ')
  cust_data[1].delete!("()")
  customer_array << cust_data
  product_array << row[2]
  master_array << [emp_data, cust_data, row[2], row[3], row[4], row[5], row[6], row[7]]
end

#clean up data!
employee_array.uniq!
customer_array.uniq!
product_array.uniq!

#populate employee table
employee_array.each do |employee|
  db_connection do |conn|
    conn.exec("INSERT INTO employees (first_name, last_name, email) VALUES ($1, $2, $3)", [employee[0], employee[1], employee[2]])
  end
end

#populate customers table
customer_array.each do |customer|
  db_connection do |conn|
    conn.exec("INSERT INTO customers (name, customer_number) VALUES ($1, $2)", [customer[0], customer[1]])
  end
end

#populate products table
product_array.each do |product|
  db_connection do |conn|
    conn.exec("INSERT INTO products (name) VALUES ($1)", [product])
  end
end

#now populate sales table with correct data and foreign keys
master_array.each do |row|
  db_connection do |conn|
    conn.exec("INSERT INTO sales (employee_id, customer_id, product_id, sale_date, sale_amount, units_sold, invoice_no, invoice_frequency)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8)",
      [row[0][2], row[1][1], row[2], row[3], row[4], row[5], row[6], row[7]])
  end
end
