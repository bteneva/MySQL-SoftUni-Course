#    16.  Orders Table
# You are given a table orders (id, product_name, order_date) filled with data. 
# Consider that the payment for an order must be accomplished within 3 days after the order date. 
# Also the delivery date is up to 1 month. Write a query to show each product's name, order date, 
# pay and deliver due dates. 
SELECT `product_name`, `order_date`,
 adddate(`order_date`, interval 3 day) AS `pay_due`, 
 adddate(`order_date`, interval 1 month) AS `deliver_due` 
 FROM `orders`;
 
 #https://www.w3schools.com/mysql/mysql_ref_functions.asp

