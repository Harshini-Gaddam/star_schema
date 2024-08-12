--Inserting values into fact and dimension tables

-- iinserting values into date_dim table
select * from payment;


insert into date_dim
(date_key, date, year, quarter, month, week, day, is_weekened)
select 
	DISTINCT TO_CHAR(payment_date::DATE, 'yyyyMMDD' ):: integer as date_key,
	date(payment_date) as date,
	EXTRACT(year from payment_date) as year,
	EXTRACT(quarter from payment_date) as quarter,
	EXTRACT(month from payment_date) as month,
	EXTRACT(week from payment_date) as week,
	EXTRACT(day from payment_date) as day,
	CASE WHEN EXTRACT(ISODOW FROM payment_date) IN (6,7) THEN true ELSE false END as is_weekend
	
from payment

select * from date_dim;

-- inserting values into customer_dim table

insert into customer_dim
	(customer_key,customer_id, first_name, last_name,email, 
	address1,address2, district,city, country,postal_code, phone, active,create_date,start_date, end_date)
select 
	c.customer_id as customer_key,
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address as address1,
	a.address2,
	a.district,
	ci.city,
	co.country,
	a.postal_code,
	a.phone,
	c.active,
	c.create_date,
	now() as start_date,
	now() as end_date
	
from customer c join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id;

-- inserting into movie_dim table

insert into movie_dim
	(movie_key, film_id, title, description, release_year, language, 
	rental_duration, length, rating, special_features)

select 
	f.film_id as movie_key, 
	f.film_id,
	f.title,
	f.description,
	f.release_year,
	l.name,
	f.rental_duration,
	f.length,
	f.rating,
	f.special_features
	
from film f join language l on f.language_id = l.language_id

select * from movie_dim;

-- inserting into store_dim dimension table

insert into store_dim
	(store_key,store_id, address1,address2,district, city, country, 
	postal_code, manager_first_name, manager_last_name, start_date, end_date)
select 
	s.store_id as store_key,
	s.store_id,
	a.address,
	a.address2,
	a.district,
	c.city,
	co.country,
	a.postal_code,
	st.first_name,
	st.last_name,
	now() as start_date,
	now() as end_date

from store s 
	join staff st on st.staff_id=s.manager_staff_id
	join address a on s.address_id = a.address_id
	join city c on a.city_id = c.city_id
	join country co on c.country_id = co.country_id

select * from store_dim;

-- inserting into fact table

insert into sales_fact
	(date_key, customer_key, movie_key, store_key, store_amount)

select 
	TO_CHAR(payment_date :: DATE, 'yyyyMMDD') :: integer as date_key,
	p.customer_id as customer_key,
	i.film_id as movie_key,
	i.store_id as store_key,
	p.amount as store_amount
	
from payment p 
join rental r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id

select * from sales_fact;
select count(*) from sales_fact;

