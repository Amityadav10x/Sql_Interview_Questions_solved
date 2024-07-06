--                                                     Practicing Joins

select * from annex1

select an.Item_Name , an.Category_Name,am.Quantity_Sold_kilo,am.Discount_Yes_No
from 
annex1 an 
join annex2 am on am.item_code = an.Item_code;


--2.

select a2.Sale_or_Return, a3.Wholesale_Price_RMB_kg,a2.Discount_Yes_No
from annex2 a2 
join
annex3 a3 on a2.Item_Code = a3.Item_Code
where Discount_Yes_No = 'Yes';

-- 3. 

select a1.Category_Name, a4.Loss_Rate
from annex1 as a1 
join annex4 a4 on a1.Item_Code = a4.Item_Code
where Category_Name = 'Capsicum'

-- find average loss rate

select a1.Category_Name, round(avg(a4.Loss_Rate),2) as avg_loss_rate
from annex1 as a1 
join annex4 a4 on a1.Item_Code = a4.Item_Code
where Category_Name = 'Capsicum'
group by a1.Category_Name
order by avg_loss_rate


-- 4. 

select a1.Category_Name, a1.Item_Name,a2.Quantity_Sold_kilo,a2.Sale_or_Return
from annex1 as a1
join
annex2 a2 on a1.Item_Code = a2.Item_Code
where Sale_or_Return  = 'sale'


-- find total / qantity_sold_kilo

select a1.Category_Name, a1.Item_Name,count(a2.Quantity_Sold_kilo) as total_quantity,a2.Sale_or_Return
from annex1 as a1
join
annex2 a2 on a1.Item_Code = a2.Item_Code
where Sale_or_Return  = 'sale'
group by Category_Name, Item_Name, Sale_or_Return

-- 5.

select a3.Date, a1.Item_Name ,  round(avg(a3.Wholesale_Price_RMB_kg),2) as avg_wholesale_value_in_$
from annex1 a1
join annex3 a3 on a1.Item_Code = a3.Item_Code
group by date, Item_Name

-- select items with higher wholesell value then 10

select a3.Date, a1.Item_Name ,  round(avg(a3.Wholesale_Price_RMB_kg),2) as avg_wholesale_value_in_$
from annex1 a1
join annex3 a3 on a1.Item_Code = a3.Item_Code
group by date, Item_Name
having round(avg(a3.Wholesale_Price_RMB_kg),2) > 10

-- 6. 

--select count(Item_Name) as total_discounted_item from annex1

select count(a1.Item_Name) as total_discounted_item, a2.Discount_Yes_No
from annex1 a1
join annex2 a2 on a1.Item_Code = a2.Item_Code
where Discount_Yes_No = 'Yes'
group by Discount_Yes_No

--  total undiscounted items

select count(a1.Item_Name) as total_undiscounted_item, a2.Discount_Yes_No
from annex1 a1
join annex2 a2 on a1.Item_Code = a2.Item_Code
where Discount_Yes_No = 'No'
group by Discount_Yes_No

-- find total sell item total

select count(a1.Item_Name) as total_sold_itmes, a2.Sale_or_Return
from annex1 a1
join
annex2 a2 on a1.Item_Code = a2.Item_Code
where Sale_or_Return = 'sale'
group by Sale_or_Return

-- find items that not sold 

select count(a1.Item_Name) as total_sold_itmes, a2.Sale_or_Return, a2.Discount_Yes_No
from annex1 a1
join
annex2 a2 on a1.Item_Code = a2.Item_Code
where Discount_Yes_No = 'No'
group by Sale_or_Return , Discount_Yes_No

