create table if not exists batch_11.anggota_zhafartriadib(
id int primary key,
nama varchar(255) not null,
no_hp varchar(12) unique not null,
registered_time timestamp not null
)

insert into batch_11.anggota_zhafartriadib values
(1,'zhafar tri adib','081298758458',current_timestamp),
(2,'zhafar tri adib','081298758457',current_timestamp),
(3,'zhafar tri adib','081298758456',current_timestamp)

update batch_11.anggota_zhafartriadib 
set nama = 'zhafar'
where id = 1

select id from anggota_zhafartriadib 

alter table batch_11.anggota_zhafartriadib drop hobby 

delete from batch_11.anggota_zhafartriadib where id !=1
