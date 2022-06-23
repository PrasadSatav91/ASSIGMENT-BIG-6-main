question
-- 1 list of all staff members including first name, last name, email,store id
-- ans
use mavenmovies;
select first_name, last_name,
email, store_id from staff;

-- 2. count of inventory items held at each store
select * from inventory;
select store_id,
count(inventory_id) as inventory_items
from inventory
group by store_id;
/* no. of  inventory items held at store 1 are 2270
 and no of inventory items held at store 2 are 2311
 */
 
 -- 3. active customers at each store
 select * from customer where active = 1;
 -- total active customers are 584
  select * from customer where active = 1 and store_id =1;
  -- total active customers in store 1 are 318
  select * from customer where active = 1 and store_id =2;
  -- total active customers in store 2 are 266
  -- or
select * from customer;
select store_id, active, -- aggregator
count(active) from customer
group by store_id, active;

  -- 4. count of all customer email address
 use mavenmovies;
 select * from customer;
 select count(email) as Email from customer;
  
  -- 5. count of unique film titles at each store and unique categories of film
  select * from inventory;
select store_id, -- [aggregator]
count(film_id) -- [aggregated value]
from inventory
group by store_id
order by count(film_id);
-- or
select store_id, film_id, -- [aggregator]
count(film_id) -- [aggregated value]
from inventory
group by store_id, film_id
order by count(film_id);
select * from film_category;
select category_id, -- [aggregator]
count(film_id) -- [aggregated value]
from film_category 
group by category_id order by count(film_id) desc;

-- 6. replacement cost for film that are least expensive, most expensive, average of films
select * from film;
select 
min(replacement_cost),
max(replacement_cost), avg(replacement_cost)
from film ;

-- 7. average pyment and maximum payment
select * from payment;
select avg(amount),
max(amount) from payment;

-- 8. customer identification number, count of rentals
select * from payment;
select customer_id, 
count(rental_id) from payment
group by customer_id
order by count(rental_id) desc;
