use mavenmovies;

#1
/*
Write a SQL query to count the number of characters except for the spaces for each actor. 
Return the first 10 actors' name lengths along with their names. 
*/
select first_name, last_name, length(first_name)+length(last_name) as Length from actor 
limit 10;

#2
#List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
select concat(first_name, " ", last_name) as FullName, awards, length(first_name)+length(last_name) as Length from actor_award
where awards like '%Oscar%';

#3
#Find the actors who have acted in the film ‘Frost Head.’
select concat(first_name, " ", last_name) as FullName from film as f
inner join film_actor as fa
on f.film_id=fa.film_id
inner join actor as a
on fa.actor_id=a.actor_id
where f.title="Frost Head";

#4
#Pull all the films acted by the actor ‘Will Wilson.’
select f.title from film as f
inner join film_actor as fa
on f.film_id=fa.film_id
inner join actor as a
on fa.actor_id=a.actor_id
where a.first_name="Will" and a.last_name="Wilson";

#5
#Pull all the films which were rented and return them in the month of May.
select f.title from rental as ren
inner join inventory as inven
on ren.inventory_id=inven.inventory_id
inner join film as f
on inven.film_id=f.film_id
where month(rental_date)=5 and month(return_date)=5;

#6
#Pull all the films with ‘Comedy’ category.
select f.title from category as cat
inner join film_category as fc
on cat.category_id=fc.category_id
inner join film as f
on fc.film_id=f.film_id
where cat.name="Comedy";



