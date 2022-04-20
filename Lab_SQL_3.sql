-- How many distinct (different) actors' last names are there?
select count(distinct last_name)
from sakila.actor;
-------------------- what did i do wrong lol
select count(distinct last_name)
from sakila.actor;


-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

select distinct (language_id)
from sakila.film;

-- How many movies were released with "PG-13" rating?
select
	rating, count(rating)
from
	sakila.film
group by 
	rating;
----------------------------- More simple way, teehee
select count(*)
from sakila.film
where rating = 'PG-13';
 
-- Get 10 the longest movies from 2006.

select
	title, length, release_year
from
	sakila.film
where release_year = '2006'
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?

select 
	datediff(max(rental_date), min(rental_date)) as days_in_business
from
	sakila.rental;
     	
-- Show rental info with additional columns month and weekday. Get 20.
select date_format(left(rental_date,10),'%M') as 'Month', date_format(left(rental_date,10),'%W') as 'Weekday' 
from sakila.rental
limit 20;
----------------------------------------------------------------- Notes
select date_format(left(rental_date,10),'%M') as 'Month', DATENAME(weekday,left(rental_date,10)) as 'Weekday' 
from sakila.rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select date_format(left(rental_date,10),'%M') as Mon, date_format(left(rental_date,10),'%w') as Weekday,
	case
		when date_format(left(rental_date,10),'%w') in (0,6) then 'weekend'
        else 'Workday'
	end as 'day_type'
from sakila.rental
limit 200;


-- How many rentals were in the last month of activity?
select date(max(rental_date)) - Interval 30 day, date(max(rental_date))
from sakila.rental;


