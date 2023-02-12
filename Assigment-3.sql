--1. List all customers who live in Texas (use JOINs)
select customer.first_name,customer.last_name,customer.email,address,district
from  customer 
full join address
on customer.address_id  = address.address_id 
where district = 'Texas';
--2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name,customer.last_name,amount
from customer 
full join payment
on customer.customer_id  = payment.customer_id 
where amount > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries)
select first_name,last_name
from customer 
where customer_id  in(
select customer_id
from payment 
group by customer_id
having sum(amount) > 175
order by sum(amount) desc
)group by customer_id,first_name,last_name;
--4. List all customers that live in Nepal (use the city table)
select  customer.first_name, customer.last_name,country
from customer
full join address 
on customer.address_id  = address.address_id
full join city
on city.city_id = address.city_id 
full join country 
on country.country_id  = city.country_id 
where country = 'Nepal';

--5. Which staff member had the most transactions?
select staff.staff_id,sum(amount)
from staff 
full join payment 
on staff.staff_id = payment.staff_id 
group by staff.staff_id;

--6. How many movies of each rating are there?
select rating,sum(film_id)
from film
group by rating;
--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id,first_name,last_name
from customer 
where customer_id  in(
select customer_id
from payment 
group by customer_id,amount
having amount = 6.99
order by customer_id
)group by customer_id,first_name,last_name;
--8. How many free rentals did our stores giveaway?
select rental_id
from payment 
where amount = 0;
