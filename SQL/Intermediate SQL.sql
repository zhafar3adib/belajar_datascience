select 
order_id as "ID untuk Order",
sales "total sales" , 
profit "profit",
quantity "jumlah pembelian",
category "kategori",
sub_category "sub kategori",
cost "biaya"
--total_cost,
--total_profit
from datasource.order_details_csv

select distinct category
from datasource.order_details_csv

select distinct substring(order_id from position('AZ' in order_id) for 2)
from datasource.order_details_csv

select substring ('Indonesia' from 3 for 4)
--mulai dari index ke 3, ambil 4 karakter

select left (order_id,2) from datasource.order_details_csv 

select sum(total_profit) , category from datasource.order_details_csv group by category

select count(*) order_id from datasource.order_details_csv 

select count(distinct sub_category) from datasource.order_details_csv

select PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY total_profit) from datasource.order_details_csv

select distinct category from datasource.order_details_csv

select
case 
when lower(category) = 'furniture' then 'haha' --jaga2 kalo namanya berantakan kasih when lower
when lower(category) = 'office supplies' then 'hihi'
when lower(category) = 'technology' then 'hoho'
end
from datasource.order_details_csv

select 
order_id as "ID untuk Order",
sales "total sales" , 
profit "profit",
quantity "jumlah pembelian",
category "kategori",
sub_category "sub kategori",
cost "biaya",
total_cost,
total_profit
from datasource.order_details_csv
where category = 'Furniture' and
(sub_category = 'Chairs' or
sub_category ='Tables')
--bisa juga pake ini setelah and: sub_category in ('Chairs','Tables')

select 
order_id as "ID untuk Order",
sales "total sales" , 
profit "profit",
quantity "jumlah pembelian",
category "kategori",
sub_category "sub kategori",
cost "biaya",
total_cost,
total_profit
from datasource.order_details_csv
where category = 'Furniture' and
(sub_category like '%ha%' or
sub_category ='Tables')

select 
order_id as "ID untuk Order",
sales "total sales" , 
profit "profit",
quantity "jumlah pembelian",
category "kategori",
sub_category "sub kategori",
cost "biaya",
total_cost,
total_profit
from datasource.order_details_csv
where category = 'Furniture' and
(sub_category like '_hai__' or
sub_category ='Tables')

select 
order_id as "ID untuk Order",
sales "total sales" , 
profit "profit",
quantity "jumlah pembelian",
category "kategori",
sub_category "sub kategori",
cost "biaya",
total_cost,
total_profit
from datasource.order_details_csv
where quantity = 2

select 
category,
sub_category,
sum(quantity) "jumlah",
sum(sales) "penjualan",
sum(profit) "untung"
from datasource.order_details_csv
group by category ,sub_category
having sum(quantity) >=200 and sum(quantity) <= 10000
order by category, sub_category desc
limit 10
-- bisa juga group by 1,2 (ikutin urutan kolom yang di query)
-- desc terbalik abjad

select 
category,
sub_category,
sum(quantity) "jumlah",
sum(sales) "penjualan",
sum(profit) "untung"
from datasource.order_details_csv
group by category ,sub_category
having sum(quantity) >=200 and sum(quantity) <= 10000
order by category,
case 
when sub_category = 'Furnishings' then 1
when sub_category = 'Supplies' then 2
when sub_category = 'Fasteners' then 3
when sub_category = 'Paper' then 4
when sub_category = 'Paper' then 5
else 6
end
--pake case when kalo mau urutannya sesuai kemauan kita





