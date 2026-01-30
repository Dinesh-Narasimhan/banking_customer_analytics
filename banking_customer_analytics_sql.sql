Create Database banking_customer_analytics;

Use banking_customer_analytics;

select * from banking;

-- What is the total bank deposits by gender?
select gender, round(sum(bank_deposits),2) as total_deposits from banking
group by gender
order by total_deposits desc;

-- Which customers have bank loans higher than the average loan amount?
select name, bank_loans from banking
where bank_loans > (select avg(bank_loans) from banking)
order by bank_loans desc;

-- Do higher loyalty customers hold more assets?
select loyalty_classification, count(client_id) as total_customers, round(avg(bank_deposits),2) as average_deposits, round(sum(bank_deposits),2) as total_deposits
from banking
group by loyalty_classification
order by total_deposits desc;

-- Which banking relationship type generates the highest deposits?
select banking_relationship, round(sum(bank_deposits),2) as total_deposits
from banking
group by banking_relationship
order by total_deposits desc;

-- Identify top 5 high-value customers by total assets
select client_id, round((bank_deposits + saving_accounts + checking_accounts),2) AS total_assets
from banking
order by total_assets desc
limit 5;

-- Are high-risk customers taking higher loans?
select risk_weighting, round(avg(bank_loans),2) as avg_loans
from banking
group by risk_weighting
order by risk_weighting desc;

-- Which investment advisors manage the highest total deposits?
select investment_advisor, count(client_id) as total_customers, round(sum(bank_deposits), 2) as total_deposits_managed
from banking
group by investment_advisor
order by total_deposits_managed desc;

-- Identify customers with loans greater than deposits (Risky Customers)
select client_id, bank_loans, bank_deposits
from banking
where bank_loans > bank_deposits;