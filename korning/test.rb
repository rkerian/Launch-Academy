require 'CSV'
require 'pg'
require 'pry'

master_array = []
employee_array = []
customer_array = []
product_array = []
sale_date_array = []
sale_amount_array = []
units_sold_array = []
invoice_no_array = []
frequency_array = []

CSV.foreach("sales.csv", headers:true) do |row|
  emp_data = row[0].split(' ')
  emp_data[2].delete!("()")
  employee_array << emp_data
  cust_data = row[1].split(' ')
  cust_data[1].delete!("()")
  customer_array << cust_data
  product_array << row[2]
  sale_date_array << row[3]
  sale_amount_array << row[4]
  units_sold_array << row[5]
  invoice_no_array << row[6]
  frequency_array << row[7]
  master_array << [emp_data, cust_data, row[2], row[3], row[4], row[5], row[6], row[7]]
end

binding.pry
