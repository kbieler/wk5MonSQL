--Week 5 - Monday Homework --


-- 1. Q:  List all customers who live in Texas (use joins).

select * from customer;
select * from address;


select first_name, last_name, customer.address_id, address.district 
from customer 
join address 
on customer.address_id = address.address_id 
where address.district = 'Texas';
-- 1. A :  Kim Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard Mccrary



-- 2. Q:  Get all payments above $6.99 with the customer's full name

select * from payment;

select customer.customer_id, first_name, last_name, payment.amount, payment.payment_id 
from customer 
join payment 
on customer.customer_id = payment.customer_id 
where payment.amount > 6.99;



-- 3.  Q: Show all customers names who have made payments over $175 (use subqueries)

select customer_id, first_name, last_name
from customer 
where customer_id in(
	select customer_id
	from payment 
	group by customer_id, payment.amount
	having payment.amount > 175);
	


-- 4. Q:  List all customers that live in Nepal (use the city table)

select * from address;

select customer.address_id, first_name, last_name, country.country 
from customer 
full join address 
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';
-- 4. A:  Kevin Schuler



-- 5.  Q:  Which staff member had the most transactions?
select * from payment;

select staff_id, staff.first_name, staff.last_name
from staff 
where staff_id in (
	select staff_id 
	from payment 
	group by staff_id 
	order by count(payment.payment_id)
	limit 1);
-- 5.  A:  Mike Hillyer



-- 6.  Q:  How many movies of each rating are there?
select * from film;

select rating, count(film_id)
from film 
group by rating;
-- 6.  A:  PG-13: 223, NC-17: 209, G: 179, PG: 194, R: 195



-- 7. Q:  Show all customers who have made a single payment above $6.99 (use subqueries)

select customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount 
	having amount > 6.99);



-- 8.  Q:  How many free rentals did our stores give away?
select * from payment;

select count(rental_id), amount
from payment
where amount is null
group by amount;
-- 8. A:  none

