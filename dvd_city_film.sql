-- Which film is giving the highest revenue
-- "Telegraph Voyage" film is giving the highest revenue
select f.title, sum(p.amount) as revenue
from public.payment as p
join rental as r on p.rental_id = r.rental_id
join inventory as i on r.inventory_id = i.inventory_id
join film as f on i.film_id = f.film_id
group by f.title
order by 2 desc

-- Which film is giving the lowest revene
-- "Texas Watch" film is giving the lowest revenue
select f.title, sum(p.amount) as revenue
from public.payment as p
join rental as r on p.rental_id = r.rental_id
join inventory as i on r.inventory_id = i.inventory_id
join film as f on i.film_id = f.film_id
group by f.title
order by 2

-- Which city is giving the highest revenue
-- "Saint-Denis" city is giving the highest revenue
select ci.city, sum(p.amount) as revenue 
from payment p 
join customer c on p.customer_id = c.customer_id
join address a on a.address_id=c.address_id
join city ci on ci.city_id=a.city_id
group by city
order by 2 desc

-- Which city is giving the lowest revenue
-- "Bydgoszcz" city is giving the lowest revenue
select ci.city, sum(p.amount) as revenue 
from payment p 
join customer c on p.customer_id = c.customer_id
join address a on a.address_id=c.address_id
join city ci on ci.city_id=a.city_id
group by city
order by 2





