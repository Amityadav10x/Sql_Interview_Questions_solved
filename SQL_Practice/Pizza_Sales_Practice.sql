-- Retrieve the total number of orders placed.

select count(order_id) as total_order_placed
from order_details;

-- Calculate the total revenue generated from pizza sales.
select sum(order_details.quantity * pizzas.price) as total_revenue
from order_details
join
pizzas on pizzas.pizza_id = order_details.pizza_id;

--  Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types
join 
pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc
limit 1;

-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name, sum(order_details.quantity) as total_quantities
from pizza_types
join 
pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join
order_details on order_details.pizza_id = pizzas.pizza_id
group by  pizza_types.name
order by total_quantities desc;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types.category, sum(order_details.quantity) as total_quantity
from pizza_types
join
pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join
order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category	
order by total_quantity desc
limit 5;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) as hour, 
count(order_id) as orders
from orders
group by hour
limit 5;

-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name) AS name
FROM
    pizza_types
group by category;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.name,
   round(sum(order_details.quantity * pizzas.price) , 2) as total_revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY total_revenue
LIMIT 5;





