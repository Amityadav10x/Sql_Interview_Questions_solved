
                    -- BANK LOAN DATABASE ANALYSIS BY AMIT 


select * from financial_loan

-- total loan application

SELECT COUNT(id) AS Total_application
FROM financial_loan

-- Month to date loan application

select count(id) AS total_mtd_application from financial_loan
where MONTH(issue_date) = 12 

-- previous month to date loan application

select count(id)  AS total_pmtd_application from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Total funded amount by bank

select SUM(loan_amount) as total_funded_amount FROM financial_loan

-- Total funded amount by month to date 


select SUM(loan_amount) as MTD_total_funded_amount FROM financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- Total funded amount by previous month to date

select SUM(loan_amount) as PMTD_total_funded_amount FROM financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Total recieved amount by bank from customer

select sum(total_payment) as Total_recieved_Amount from financial_loan 

-- Current month data of Total recieved amount by bank from customer

select sum(total_payment) as Total_recieved_Amount_of_current_month from financial_loan 
where month(issue_date) = 12 

-- Previous month data of Total recieved amount by bank from customer

select sum(total_payment) as Total_recieved_Amount_of_previous_month from financial_loan 
where month(issue_date) = 11 and YEAR(issue_date) = 2021

-- Average interest  rate 

select round(AVG(int_rate),4) * 100 as avg_interest_rate from financial_loan

-- Month to date average interest rate

select round(AVG(int_rate),4) * 100 as month_to_date_avg_interest_rate from financial_loan
where month(issue_date) = 12 

-- Previous Month to date average interest rate

select round(AVG(int_rate),4) * 100 as previous_month_to_date_avg_interest_rate from financial_loan
where month(issue_date) = 11


-- Average dept to income ratio

select round(avg(dti),4)* 100 as Avg_Dti from financial_loan


-- month to date Average dept to income ratio

select round(avg(dti),4)* 100 as MTD_Avg_Dti from financial_loan
where MONTH(issue_date) = 12

-- Previous month to date Average dept to income ratio

select round(avg(dti),4)* 100 as Avg_Dti from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- ----------------------- Good loan  ----------------------------

-- Good loan percentage 

select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current'
then id end) * 100) /

count(id) as Good_loan_percentage
from financial_loan

-- Good loan applications

select count(id) as Good_loan_Application from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current'


-- Good loan funded amount

select SUM(loan_amount)  as Good_loan_Funded_Amount from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good loan Total amount recieved by bank from customer

select SUM(total_payment)  as Good_loan_Funded_Amount from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current'

 -- --------------------- FOR BAD LOANS -------------------------

 -- Bad loan percentage

 select (count(case when loan_status = 'Charged off'
then id end) * 100.0) /

count(id) as Bad_loan_percentage
from financial_loan


-- Bad loan applications

select count(id) as Bad_loan_Application from financial_loan
where loan_status = 'Charged off' 


 -- Bad loan funded amount

select SUM(loan_amount)  as Bad_loan_Funded_Amount from financial_loan
where loan_status = 'Charged off'

 -- Bad loan Total amount recieved by bank from customer

select SUM(total_payment)  as Bad_loan_Recieved_Amount_From_Customer from financial_loan
where loan_status = 'Charged off' ;



-- ----------------------- Loan Status Paid Grid vIEw -------

select * from financial_loan

SELECT loan_status,
       COUNT(id) AS Total_loan_Application,
       SUM(total_payment) AS Total_Amount_Recived,
       SUM(loan_amount) AS total_funded_amount,
       AVG(int_rate) * 100 AS interest_rate,
       AVG(dti * 100) AS DTI
FROM financial_loan
GROUP BY loan_status

-- BY MTD how much recieved and how much funded

SELECT loan_status,
       COUNT(id) AS Total_loan_Application,
       SUM(total_payment) AS MTD_Total_Amount_Recived,
       SUM(loan_amount) AS MTD_TOTAL_funded_amount
       
FROM financial_loan
WHERE month(issue_date) = 12
GROUP BY loan_status;

-- For pmtd how much recieved and how much funded

SELECT loan_status,
       COUNT(id) AS Total_loan_Application,
       SUM(total_payment) AS PMTD_Total_Amount_Recived,
       SUM(loan_amount) AS PMTD_TOTAL_funded_amount
       
FROM financial_loan
WHERE month(issue_date) = 11 AND year(issue_date) = 2021
GROUP BY loan_status;


-- -------------------------------- FOR OVERVIEW -- -------------

-- Monthly Trends by issue date

select 
MONTH(issue_date) As month_number,
DATENAME(month,issue_date) as month_names,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount
from financial_loan
group by MONTH(issue_date), DATENAME(month,issue_date)
order by MONTH(issue_date)


-- Monthly Trends by issue date and grade

select 
MONTH(issue_date) As month_number,
DATENAME(month,issue_date) as month_names,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount
from financial_loan
where grade = 'A'
group by MONTH(issue_date), DATENAME(month,issue_date)
order by MONTH(issue_date)

-- regional analysis by state

select 
address_state,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount,
round(avg(int_rate),4)* 100 as avg_interset_rate
from financial_loan
group by address_state
order by sum(loan_amount) desc


-- loan Term Analysis

select 
term,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount,
round(avg(int_rate),4)* 100 as avg_interset_rate
from financial_loan
group by term
order by term 


-- employee lenght analysis
select * from financial_loan

select 
emp_length,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount
from financial_loan
group by emp_length
order by COUNT(id) desc


-- loan purpose breakdown

select 
purpose,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount
from financial_loan
group by purpose
order by COUNT(id) desc

--  home ownership Analysis

select * from financial_loan

select 
home_ownership,
count(id) as total_loan_application,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_recieved_amount
from financial_loan
group by home_ownership
order by COUNT(id) desc





