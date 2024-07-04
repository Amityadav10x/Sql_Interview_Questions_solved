select * from sales
where payment_method = "Credit card" and branch = 'A' and city = 'Yangon';

select product_line from sales where rating > 7;

SELECT DISTINCT
    city
FROM
    sales;
    
SELECT DISTINCT
    city, branch
FROM
    sales;
    
SELECT DISTINCT
    COUNT(product_line) as product_line
FROM
    sales;
    
select payment_method,
 count(payment_method) as payment_method
 from sales
 group by payment_method
 order by payment_method  desc;
 
 
select product_line,
count(product_line) as product_line
from sales
group by product_line
order by product_line asc;


select month_name as month,
sum(total) as total_revenue
from sales 
group by month_name
order by total_revenue desc;

select month_name as month,
sum(cogs) as cogs 
from sales
group by month_name
order by cogs desc;

select product_line as products,
sum(total) as total_revenue
from sales 
group by product_line
order by total_revenue desc;

select city,
sum(total) as total_revenue
from sales 
group by city 
order by total_revenue desc;

select product_line as products,
avg(VAT) as avg_vat
from sales 
group by product_line
order by avg_vat desc;

select city ,branch,
sum(total) as total_sales
from sales
group by city,branch
order by total_sales desc;

select gender , product_line,
count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;

select
round(avg(rating), 2) as avg_rating, product_line
from sales
group by rating, product_line
order by avg_rating desc;


SELECT 
    time_of_days, COUNT(total) AS total_sales
FROM
    sales
WHERE
    day_name = 'Friday'
GROUP BY time_of_days
ORDER BY total_sales DESC;


SELECT 
    customer_type AS customer, SUM(total) AS total_revenue
FROM
    sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

select city ,
round(avg(VAT),2) as largest_tex
from sales 
group by city
order by largest_tex desc;

select customer_type as customers,
round(avg(vat),2) as tax_payed
from sales
group by customer_type
order by tax_payed desc;

SELECT DISTINCT
    customer_type
FROM
    sales;
    
SELECT DISTINCT
    payment_method as unique_payment_methods
FROM
    sales;
    
select customer_type,
count(total) as total_buying
from sales
group by customer_type
order by total_buying desc;

select gender, count(gender) as gender_cnt
from sales
group by  gender
order by gender_cnt desc;

select gender,
count(*) as gender_distribution
from sales
where branch = "B"
group by gender
order by gender_distribution;

select time_of_days,
round(avg(rating),2) as ratings
from sales
group by time_of_days
order by ratings desc;

select time_of_days,
round(avg(rating),2) as ratings
from sales
where branch = "C"
group by time_of_days
order by ratings desc;


select day_name,
round(avg(rating),2) as Avg_ratings
from sales 
group by day_name
order by Avg_ratings desc;

select day_name,
round(avg(rating),2) as Avg_ratings
from sales 
where branch = "A"
group by day_name
order by Avg_ratings desc;
















 
