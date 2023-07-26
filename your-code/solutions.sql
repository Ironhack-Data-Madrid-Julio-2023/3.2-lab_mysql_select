-- Challenge 1 

select ta.au_id, au_lname, au_fname, title, pub_name
from authors as a
left join titleauthor as ta 
on a.au_id = ta.au_id
left join titles as t 
on ta.title_id = t.title_id
left join publishers as p
on p.pub_id = t.pub_id

-- Challenge 2

select ta.au_id, au_lname, au_fname, pub_name, count(title)
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id

group by ta.au_id, pub_name;

-- Challenge 3

select  a.au_id, au_lname, au_fname, sum(qty) as qty
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
right join sales as s
on s.title_id = ta.title_id

group by a.au_id
order by qty desc
limit 3;

-- Challenge 4
select  a.au_id, au_lname, au_fname, ifnull(sum(qty), 0) as qty
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on t.title_id = ta.title_id
left join publishers as p
on p.pub_id = t.pub_id
left join sales as s
on s.title_id = ta.title_id

group by a.au_id
order by qty desc