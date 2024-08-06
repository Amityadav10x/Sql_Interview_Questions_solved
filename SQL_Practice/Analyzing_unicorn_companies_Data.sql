-- ------------------------------------------------------------------------ Analysing Unicorn Compnies Dataset -----------------------------------------------------------------------
-- -------------------------------------------Basic -------------------------


-- Write a query to select all columns from the table
select * from Unicorn_Data

-- Write a query to select the names and valuations of all companies.

select Company, Valuation_B
from Unicorn_Data

-- Write a query to count the number of companies in the dataset.

select  count(Company) as number_of_companies
from Unicorn_Data

-- Write a query to select the companies based in China.

select Company
from Unicorn_Data
where Country = 'China'

-- Write a query to find the companies founded after the year 2010.

select Company
from Unicorn_Data
where Founded_Year = 2010

-- Write a query to list the companies with a valuation greater than $100 billion.

select Company
from Unicorn_Data
where Valuation_B > $100

-- Write a query to find the total raised amount for SpaceX.

select Total_Raised
from Unicorn_Data
where Company = 'SpaceX'


-- Write a query to list the names and countries of companies in the Artificial Intelligence industry.

select Company,Country
from Unicorn_Data
where Industry = 'Artificial Intelligence'

-- Write a query to find top 10 compnies with the highest number of investors.

select top 10 Company, Investors_Count
from Unicorn_Data
order by Investors_Count desc

-- Write a query to list all companies along with their financial stage.

select Company, Financial_Stage
from Unicorn_Data

------------------------------------------------------------------  INTERMEDIATE LEVEL ------------------------------------

-- Write a query to find the average valuation of companies in the dataset.

select Company, avg(Valuation_B) as avg_valuation_in_billion$
from Unicorn_Data
group by Company

-- Write a query to list the companies founded before the year 2005 and their total raised amount.

select Company, Total_Raised
from Unicorn_Data
where Founded_Year < 2005

-- Write a query to find the total number of portfolio exits for all companies combined.

select Company, sum(Portfolio_Exits) as total_number_of_portfolis
from Unicorn_Data
group by Company 
order by total_number_of_portfolis asc

-- Write a query to find the companies with more than 10 deal terms.

select Company, Deal_Terms
from Unicorn_Data
where Deal_Terms > 10
order by Deal_Terms desc

-- Write a query to list companies and their founded year, sorted by founded year in descending order.

select Company, Founded_Year
from Unicorn_Data
order by Founded_Year desc

-- Write a query to find the total valuation of companies in the United States.

select Company, sum(Valuation_B) as total_valuation_in_billion_$
from Unicorn_Data
where Country = 'United States'
group by Company 
order by total_valuation_in_billion_$ desc

-- Write a query to find the company with the earliest founded year.

select Company
from Unicorn_Data
where Founded_Year > 2015 and Founded_Year < 2023

-- Write a query to find the sum of valuations of companies in the Artificial Intelligence industry.

select Company, sum(Valuation_B) as valuations_of_companies_in_billion$
from Unicorn_Data
where Industry = 'Artificial Intelligence'
group by Company
order by valuations_of_companies_in_billion$ desc

-- -------------------------------------------------------- Advance Level -------------------------------------------

--  Write a query to find the average number of investors for companies in each country.

select Company, Country, avg(Investors_Count) as avg_number_investors
from Unicorn_Data
group by Company, Country
order by avg_number_investors desc

-- Write a query to list companies with their valuations and total raised amount, sorted by valuation in descending order.

select Company, Valuation_B, Total_Raised
from Unicorn_Data
order by Valuation_B desc

-- Write a query to find the number of companies in each industry.

select Industry, count(Company) as number_of_compnies
from Unicorn_Data
group by Industry
order by number_of_compnies desc

-- Write a query to list the companies along with their valuation and portfolio exits, ordered by portfolio exits in descending order.

select Company,Valuation_B, Portfolio_Exits
from Unicorn_Data
order by Portfolio_Exits desc

-- Write a query to find the average valuation of companies founded after 2010.

select Company,avg(Valuation_B) as avg_valuation_billion_$
from Unicorn_Data
where Founded_Year > 2010
group by Company
order by avg_valuation_billion_$ desc

-- Write a query to find the total raised amount for companies with an IPO financial stage.

select Company, Total_Raised as Total_Raised_Amount
from Unicorn_Data
where Financial_Stage = 'IPO'
order by Total_Raised_Amount desc

-- Write a query to list the companies along with the total raised amount, filtered by those having more than 5 portfolio exits.

select Company, Total_Raised as total_raised_amount
from Unicorn_Data
where Portfolio_Exits > 5
group by Company, Total_Raised
order by total_raised_amount

-- Write a query to find the average valuation of companies in each financial stage.

select Company, Financial_Stage, avg(Valuation_B) as average_valuation
from Unicorn_Data
group by Company, Financial_Stage
order by average_valuation desc

-- Write a query to find the company with the highest total raised amount.

select Company, max(Total_Raised) as total_raised_amount
from Unicorn_Data
group by Company
order by total_raised_amount 

-- Write a query to list companies along with their valuation and the number of select investors, sorted by the number of select investors in descending order.

select Company, Valuation_B, Select_Inverstors
from Unicorn_Data
order by Select_Inverstors desc


-- ----------------------------------------------------------------- Thank You ------------------------------------------------------------------------
