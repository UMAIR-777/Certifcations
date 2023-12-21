SELECT * FROM pizzdb.pizza_sales;
use pizzdb;
UPDATE pizza_sales
SET order_date =
    CASE
        WHEN order_date LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(order_date, '%d/%m/%Y'), '%Y-%m-%d')
        -- Add more conditions and conversions for different formats as needed
        ELSE order_date  -- If the date format doesn't match any known format, leave it unchanged
UPDATE pizza_sales
SET order_date = DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m-%d')
WHERE order_date NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
select * from pizza_sales;
/* THERE IS A LARGE DATASET OF PIZZA SALES 
NOW IT'S MY TASK TO MONITOR AND
 EVALUATE TRACK PERFORMENCE  OVER TIME OF THIS LARGE DATASET
 BY USING KPIs TO GET INSIGHTS AND MAKE DATA-DRIVEN DECISION*/
 
 --NO1 KEY PERFORMENCE METRICS
 --1 Total Revenue: The sum of all the revenue generated from sales--
SELECT total_price FROM pizza_sales
show columns from pizza_sales;
--2 Total Orders: The count or quantity of orders received or processed within a given timeframe.
SELECT COUNT(distinct order_id) AS Total_orders from pizza_sales;
--3 Average order quantity  avg no of pizzas order per order
 select sum(distinct order_id) / count(distinct order_id)as Average_Order_qunatity from pizza_sales;
 --4 total pizza sold total units sold
 select pizza_category, sum(quantity) as Total_Quantity_Sold from pizza_sales
 group by pizza_category ;
 select   monthname(order_date) as Order_monthly, sum(total_price) as Total_revenue,  from pizza_sales
 group by  monthname(order_date) ;
monthname

