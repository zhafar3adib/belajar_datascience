

--jawaban no 1
select c.id customer_id , t.total_transaction
from datasource_sql_ds11.customer c
left join
(select customer_id , count(id) total_transaction
from datasource_sql_ds11."transaction"  
group by customer_id)
t on c.id = t.customer_id
where c.gender = 'Female' and c.email = 'Gmail' and c.city = 'Jakarta' and t.total_transaction >10

--jawaban no 2
select product_id , sum(quantity) total
from datasource_sql_ds11."transaction" 
where created_at between '2018-10-01' and '2018-12-31'
and quantity > (select avg(quantity) from datasource_sql_ds11."transaction" )
group by product_id
order by total desc 
limit 5

--jawaban no 3
select distinct s.id, s.type, c.gender, c.city, count(t.id) transaction_count
from datasource_sql_ds11."transaction" t
left join datasource_sql_ds11.customer c on t.customer_id = c.id
left join datasource_sql_ds11.store s on t.store_id = s.id 
group by s.id, s.type, c.city, c.gender 
order by transaction_count desc







