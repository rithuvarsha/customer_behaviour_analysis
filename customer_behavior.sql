select top 20 * from customer;

--Q1. Which age groups contribute most to highest overall revenue and purchase frequency?
select age_group,
count(*) as order_count,
sum(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;

--Q2.  What is the average frequency of purchases across different age groups?
select age_group, AVG(purchase_frequency_days) as avg_frequency
from customer
group by age_group;

--Q3. Which customer segments are most likely to apply discounts when purchasing?
select gender, age_group, COUNT(*) as discounted_purchases
from customer
where discount_applied = 'Yes'
group by gender, age_group
order by discounted_purchases desc;

--Q4. Compare review rating averages across payment methods. Are some payment types linked to higher customer satisfaction?
select payment_method, AVG(review_rating) as avg_rating
from customer
group by payment_method;

--Q5. Most frequently purchased categories by repeat customers
select category, count(*) as purchase_count
from customer
where previous_purchases > 0
group by category
order by purchase_count desc;

--Q6. Do loyal customers have shorter purchase_frequency_days compared to others?
select subscription_status, AVG(purchase_frequency_days) as avg_days
from customer
group by subscription_status;

--Q7. Products with highest repeat purchase rates
select item_purchased, count(*) as repeat_customer
from customer
where previous_purchases > 0
group by item_purchased
order by repeat_customer desc;

--Q8. Which shipping_type is preferred by customers who have made more than 5 previous purchases?
select shipping_type, COUNT(*) as num_customers
from customer
where previous_purchases > 5
group by shipping_type
order by num_customers desc;

--Q9. Is there a correlation between high review_rating and increased purchase_amount?
select review_rating, avg(purchase_amount) as avg_purchase
from customer
group by review_rating
order by review_rating desc;

--Q10. Are customers with high frequency_of_purchases more likely to buy from specific categories?
select category, count(*) as high_frequency_buyers
from customer
where purchase_frequency_days > (select AVG(purchase_frequency_days) from customer)
group by category
order by high_frequency_buyers;

--Q11. Do customers with subscriptions give higher review ratings than non-subscribers?
select subscription_status, round(AVG(review_rating),2) as avg_review
from customer
group by subscription_status;

--Q12. Which payment method is most commonly used by customers who apply discounts?
select payment_method, count(*) as discounted_transaction
from customer
where discount_applied = 'Yes'
group by payment_method
order by discounted_transaction desc;

--Q13. What is the age distribution of customers who make frequent purchases?
select age_group, count(*) as frequent_buyers
from customer
where purchase_frequency_days < 15
group by age_group
order by frequent_buyers desc;

--Q14. What percentage of customers in each age_group hold an active subscription?
select age_group, count( case when subscription_status = 'Yes' then 1 end) * 100/ count(*) as subscription_pct
from customer
group by age_group;

--Q15. which are the top 5 products with highest avg review ratings?
select top 5 item_purchased, round(AVG(review_rating),2) as 'Avg Product Review'
from customer
group by item_purchased
order by [Avg Product Review] desc;

--Q16. Compare the average purchase amounts between standard and express shipping
select shipping_type, round(avg(purchase_amount),2) as Avg_spend
from customer
where shipping_type in ('Standard','Express')
group by shipping_type;

--Q17. Do subscribed customers spend more? Compare average spend and total revenue between subscribers and non-subscribers.
select subscription_status, count(customer_id) as total_customers,
round(avg(purchase_amount),2) as avg_spend,
round(sum(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc;

--Q18. Segment customers into New, Loyal and Returning based on their total number of previous purchases and show the count of each segment.
with customer_type as
(select customer_id, previous_purchases,
case 
	when previous_purchases = 1 then 'New'
	when previous_purchases between 2 and 10 then 'Returning'
	when previous_purchases > 10 then 'Loyal'
	end as customer_segment
from customer)
select customer_segment, count(*) as 'Number of Customers'
from customer_type
group by customer_segment;

--Q19. What are the top 3 most purchased products across each categories?
with item_counts as (
select category, item_purchased, count(customer_id) as total_orders,
row_number () over (partition by category order by count(customer_id) desc) as item_rank
from customer
group by category, item_purchased)

select item_rank, category, item_purchased, total_orders
from item_counts
where item_rank <=3;

--Q20. Are customers who are repeat buyers (>5 previous purchases) also likely to subscribe?
select subscription_status, count(customer_id) as repeat_buyers
from customer
where previous_purchases > 5
group by subscription_status;