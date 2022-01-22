--The marketing team wants to measure the audience for our product ad.
--They asked you about, how many female customers do you think in Jakarta have Gmail accounts?
--Also, if possible, they want to push the ad to potential users only. So they think it’s better if you filter
--them by those who have transactions at least 10 times
select c.id customer_id , t.total_transaction
from datasource_sql_ds11.customer c
left join
(select customer_id , count(id) total_transaction
from datasource_sql_ds11."transaction"  
group by customer_id)
t on c.id = t.customer_id
where c.gender = 'Female' and c.email = 'Gmail' and c.city = 'Jakarta' and t.total_transaction >10

--The product team wants to add some new products to our marketplace this week.
--Can you advise currently which product has the maximum performance in Q4 (Oct 2018 - Dec 2018)?
--Let say give them the top 5 products that have total transactions (quantity) above average
select product_id , sum(quantity) total
from datasource_sql_ds11."transaction" 
where created_at between '2018-10-01' and '2018-12-31'
and quantity > (select avg(quantity) from datasource_sql_ds11."transaction" )
group by product_id
order by total desc 
limit 5

--Our CEO asked what type of store currently gets the most transaction-specific in quantity from the Jakarta region?
--Is it the same between males and females? For comparison, please share outside the Jakarta region as well
select distinct s.id, s.type, c.gender, c.city, count(t.id) transaction_count
from datasource_sql_ds11."transaction" t
left join datasource_sql_ds11.customer c on t.customer_id = c.id
left join datasource_sql_ds11.store s on t.store_id = s.id 
group by s.id, s.type, c.city, c.gender 
order by transaction_count desc







