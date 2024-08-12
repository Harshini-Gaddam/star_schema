-- Joining all tables and examining the time it takes

select f.title, extract(month from p.payment_date) as month, 
	ci.city, sum(p.amount) as revenue

from payment p 
join rental r on p.rental_id = p.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on f.film_id = i.film_id
join customer c on c.customer_id = p.customer_id
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
-- join country co on ci.country_id = co.country_id
group by f.title, month, ci.city
order by f.title, month, ci.city, revenue desc


-- using fact and dimension tables
select movie_dim.title, date_dim.month, customer_dim.city, sum(store_amount) as revenue
from sales_fact
join movie_dim on movie_dim.movie_key = sales_fact.movie_key
join date_dim on date_dim.date_key = sales_fact.date_key
join customer_dim on customer_dim.customer_key = sales_fact.customer_key
group by movie_dim.title, date_dim.month, customer_dim.city
order by 1,2,3, 4 desc


-- Using joins, it took almost 4 sec for the query to execute 
-- Using dimension and fact table, it took 306 ms to execute 