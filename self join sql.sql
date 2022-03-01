use sakila;

#List the number of films per category.

select c.name, count(f.film_id)
from category c
left join film_category f
on c.category_id = f.category_id
group by c.name
order by c.name asc;

#Display the first and the last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
left join address a
on s.address_id = a.address_id
group by s.first_name, s.last_name, a.address;

#Display the total amount rung up by each staff member in August 2005.

select sum(p.amount), s.first_name, s.last_name
from payment p
left join staff s
on p.staff_id = s.staff_id
between "01/08/2005" and "31/08/2005"
group by s.first_name, s.last_name;

#List all films and the number of actors who are listed for each film.

select count(a.actor_id) as num_actors, a.film_id, f.title
from film_actor a
left join film f 
on a.film_id = f.film_id
group by a.film_id, f.title
order by a.film_id;

#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.

select sum(p.amount) as total, c.first_name, c.last_name
from payment p
left join customer c 
on c.customer_id = p.customer_id
group by c.last_name, c.first_name
order by c.last_name;