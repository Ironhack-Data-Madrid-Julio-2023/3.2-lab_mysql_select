-- CHALLENGE_1

select ta.au_id, au_lname, au_fname, pub_name, title

from titleauthor as ta
left join 
titles as t
on t.title_id = ta.title_id
left join 
authors as a
on a.au_id = ta.au_id
left join 
publishers as pb
on pb.pub_id = t.pub_id

-- CHALLENGE_2

select ta.au_id, au_lname, au_fname, pub_name, title, count(title) as  title_count

from titleauthor as ta
left join 
titles as t
on t.title_id = ta.title_id
left join 
authors as a
on a.au_id = ta.au_id
left join 
publishers as pb
on pb.pub_id = t.pub_id

group by ta.au_id, pub_name

-- CHALLENGE_3

select ta.au_id, au_lname, au_fname, title, sum(qty) as  total

from titleauthor as ta
left join 
titles as t
on t.title_id = ta.title_id
left join 
authors as a
on a.au_id = ta.au_id
left join 
sales as sl
on t.title_id = sl.title_id

group by ta.au_id
order by total desc
limit 3

-- CHALLENGE_4

select ta.au_id, au_lname, au_fname, title, sum(qty) as  total

from titleauthor as ta
left join 
titles as t
on t.title_id = ta.title_id
left join 
authors as a
on a.au_id = ta.au_id
left join 
sales as sl
on t.title_id = sl.title_id

group by ta.au_id
order by total desc

