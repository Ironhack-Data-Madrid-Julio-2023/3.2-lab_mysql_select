## CHALLENGE 1:

select  ta.au_id,au_fname as first_name,au_lname as last_name,title,pub_name as publishers
        
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id

## CHALLENGE 2:

select  ta.au_id,au_fname as first_name,au_lname as last_name,pub_name as publishers,count(title) as title_count
        
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
group by ta.au_id, a.au_fname, a.au_lname, p.pub_name


## CHALLENGE 3:

select  ta.au_id,au_fname as first_name,au_lname as last_name,sum(qty) as total
        
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join sales as s
on s.title_id = t.title_id
group by ta.au_id 
order by total DESC

## CHALLENGE 4:

select  ta.au_id,au_fname as first_name,au_lname as last_name,sum(qty) as total
        
from titleauthor as ta
left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join sales as s
on s.title_id = t.title_id
group by ta.au_id 
order by total DESC
limit 3;




