select extract (month from current_timestamp)

select date_trunc('month', current_timestamp) 
--date trunc motong

select current_timestamp::date - '2021-11-01 13:13:13'::date
select current_timestamp - '2021-11-01 13:13:13'
select current_timestamp + interval '30 days'

select 
	c.id, 
	c.city, 
	c.email, 
	c.gender,
	s.type,
	p.id,
	p.price,
	t.quantity,
	p.price * t.quantity as total, 
	t.created_at
from datasource_sql_ds11.customer c
left join datasource_sql_ds11.transaction t on c.id = t.customer_id
left join datasource_sql_ds11.store s on t.store_id = s.id 
left join datasource_sql_ds11.product p on t.product_id = p.id

select id,gender as nomor
from datasource_sql_ds11.customer
where email != 'Gmail'
union all 
select id,gender
from datasource_sql_ds11.customer
where email = 'Gmail'
--kasih nama tabel di tabel pertama aja
--antara tabel pertama dan kedua harus sama datatypenya

select 
	c.id, 
	sum(t.quantity)::float/(select sum(t.quantity)
	from datasource_sql_ds11.transaction t)*100
from datasource_sql_ds11.customer c
left join datasource_sql_ds11.transaction t on c.id = t.customer_id
left join datasource_sql_ds11.store s on t.store_id = s.id 
left join datasource_sql_ds11.product p on t.product_id = p.id
group by 1
order by 2 desc 
limit 10

with 
	filtered_transactions as (
		select *
		from datasource_sql_ds11.transaction
		where store_id = 2
	),
	pool as (
		select id from datasource_sql_ds11.customer 
		where email <> 'Gmail' and city = 'Jakarta'
	)
select 
	c.id, 
	sum(t.quantity)
from datasource_sql_ds11.customer c
left join filtered_transactions t on c.id = t.customer_id
left join (
	select id, type from datasource_sql_ds11.store where id = 2
	) s on t.store_id = s.id 
left join datasource_sql_ds11.product p on t.product_id = p.id
where c.id in (select id from pool)
group by 1
order by 2 desc
limit 10

select
row_number () over (partition by city order by id ) as nomor,
	c.id, 
	c.city, 
	c.email, 
	c.gender
	from datasource_sql_ds11.customer c



