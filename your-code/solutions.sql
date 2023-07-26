CHALLENGE 1

select * from titles;

select * from titles as t
left join titleauthor as a
on t.title_id=a.title_id;


select au.au_id, au.au_fname, au.au_lname, t.title, p.pub_name
from titles as t
left join titleauthor as a on t.title_id=a.title_id
left join publishers as p on t.pub_id=p.pub_id
left join authors as au on a.au_id=au.au_id; 


CHALLENGE 2

SELECT
    au.au_id,
    au.au_fname,
    au.au_lname,
    p.pub_name,
    COUNT(title) AS title_count
FROM
    titles AS t
LEFT JOIN
    titleauthor AS a ON t.title_id = a.title_id
LEFT JOIN
    publishers AS p ON t.pub_id = p.pub_id
LEFT JOIN
    authors AS au ON a.au_id = au.au_id
GROUP BY
    au.au_id,
    au.au_fname,
    au.au_lname,
    p.pub_name;


CHALLENGE 3

select au.au_id, au.au_fname, au.au_lname, sum(qty) as book_sales
from titles as t
left join titleauthor as a on t.title_id=a.title_id
left join publishers as p on t.pub_id=p.pub_id
left join authors as au on a.au_id=au.au_id
left join sales as sl on t.title_id=sl.title_id

group by au.au_id, au.au_fname, au.au_lname
ORDER BY
    book_sales DESC
LIMIT 3;

CHALLENGE 4

select au.au_id, au.au_fname, au.au_lname, COALESCE(SUM(qty), 0) as book_sales
from authors as au
left join titleauthor as a on au.au_id=a.au_id
left join titles as t on t.title_id=a.title_id
left join sales as sl on t.title_id=sl.title_id

group by au.au_id, au.au_fname, au.au_lname
ORDER BY
    book_sales DESC;


