
/*----------------------- CHALLENGE 1 ------------------------*/

select 
a.au_id as author_id, au_lname as last_name, au_fname as first_name,
title as title, pub_name as publishers

from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id;


/*------------------------ CHALLENGE 2 ------------------------*/


select 
au_lname as last_name, au_fname as first_name, pub_name as publishers, 
count(t.title_id) as title_count

from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id

group by a.au_id, p.pub_name
order by title_count desc;


/*------------------------ CHALLENGE 3 ------------------------*/


select 
au_lname as last_name, au_fname as first_name,
sum(s.qty) as total

from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id
inner join sales as s
on s.title_id = t.title_id

group by a.au_id
order by total desc
limit 3;

/*------------------------ CHALLENGE 4 ------------------------*/

select 
au_lname as last_name, au_fname as first_name,
ifnull(sum(s.qty), 0) as total

from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
left join sales as s
on s.title_id = t.title_id

group by a.au_id
order by total desc;