-- Question 1
select * from customer;
select * from address;
select customer.first_name, address.district
from customer
join  address
on customer.address_id = address.address_id
where address.district like 'Texas' ;



-- Question 2
select * from customer; 
select * from payment; 
select customer.first_name, customer.last_name, payment.amount
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount  > 6.99;


--Question 3
select first_name
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);


--Question 4
select customer.first_name, country.country
from customer
join address
on address.address_id = customer.address_id
join city
on address.city_id = city.city_id
join country
on country.country_id = city.country_id
where country.country like 'Nepal';
--Kevin


--Question 5

select * from staff; 
select * from payment; 
select staff.first_name, count(payment.staff_id)
from staff
join payment
on payment.staff_id = staff.staff_id
group by staff.first_name , payment.staff_id
order by count(payment.staff_id) desc ;
-- Jon 

--Question 6
select * from film;
select rating, count(rating)
from film
group by rating, rating
order by count(rating) desc;


-- there are 5 223 PG-13 movies, 209 NC-17 movies, 195 R movies, 194 PG movies and 179 G movies



--Question 7
select * from payment;
select customer_id, first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 6.99
);



--Question 8
select * from film;
select * from payment;
select film.film_id , film.title
from film
join inventory
on film.film_id = inventory.film_id
join rental
on inventory.inventory_id = rental.inventory_id
join payment
on rental.rental_id = payment.rental_id
where payment.amount = 0;
-- 23 movies 
