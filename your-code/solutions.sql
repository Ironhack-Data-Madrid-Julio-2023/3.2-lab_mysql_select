Challenge 1

select  ta.au_id,
        au_fname as first_name,
        au_lname as last_name,
        title,
        pub_name
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
;

Challenge 2

select  ta.au_id as au_id,
        max(au_fname) as first_name,
        max(au_lname) as last_name,
        count(title),
        max(pub_name)
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id

group by ta.au_id;

Challange 3

select  ta.au_id as au_id,
        max(au_fname) as first_name,
        max(au_lname) as last_name,
        count(title),
        max(pub_name),
        sum(qty) as qty
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
right join sales as s
on s.title_id = ta.title_id

group by ta.au_id
order by qty desc
limit 3;

Challenge 4

select  ta.au_id as au_id,
        max(au_fname) as first_name,
        max(au_lname) as last_name,
        count(title),
        max(pub_name),
        sum(qty) as qty
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
right join sales as s
on s.title_id = ta.title_id

group by ta.au_id;



