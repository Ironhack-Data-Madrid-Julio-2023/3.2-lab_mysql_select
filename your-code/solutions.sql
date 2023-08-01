EJERCICIO 1

select au_id, completename, t_a.title, publisher
from 
(select t.title, t.title_id, p.pub_id, pub_name as publisher
from titles as t
inner join pub_info as p
on t.pub_id= p.pub_id
inner join publishers as pu
on p.pub_id = pu.pub_id)
as t_a
inner join 
(select t.title, a.au_id, concat(au.au_fname, ' ', au.au_lname) as completename, t.title_id
from titles as t
inner join titleauthor as a
on t.title_id=a.title_id
inner join authors as au
on a.au_id=au.au_id)
as p_n
on  t_a.title = p_n.title

EJERCICIO 2

select a.au_id, concat(au_lname, ' ', au_fname) as complete_name, pub_name as publishers, count(t.title) as title_count
FROM authors as a
inner join titleauthor as t_a
on t_a.au_id = a.au_id
inner join titles as t
on t.title_id = t_a.title_id
inner join publishers as p
on p.pub_id = t.pub_id
group by au_id, pub_name

EJERCICIO 3

select au.au_id, concat(au_lname, ' ', au_fname) as complete_name, sum(qty) as total
from authors as au
inner join titleauthor as t_a
on t_a.au_id = au.au_id
inner join sales as s
on s.title_id  = t_a.title_id
group by au_id, complete_name
order by total desc
limit 3

EJERCICIO 4

select au.au_id, concat(au_lname, ' ', au_fname) as complete_name, ifnull (sum(s.qty), 0) as total
from authors as au
left join titleauthor as t_a
on t_a.au_id = au.au_id
left join sales as s
on s.title_id  = t_a.title_id
group by au_id, complete_name
order by total desc