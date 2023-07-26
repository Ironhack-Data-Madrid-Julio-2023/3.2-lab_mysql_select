Challenge #1

SELECT a.au_id,au_lname, au_fname,ti.title,p.pub_name
FROM authors as a
LEFT JOIN titleauthor as t
ON a.au_id = t.au_id
INNER JOIN titles as ti
ON t.title_id = ti.title_id
INNER JOIN publishers as p
ON ti.pub_id = p.pub_id

Challenge #2

SELECT au_lname, au_fname,p.pub_name, count(*) as TOTAL
FROM authors as a
LEFT JOIN titleauthor as t
ON a.au_id = t.au_id
INNER JOIN titles as ti
ON t.title_id = ti.title_id
INNER JOIN publishers as p
ON ti.pub_id = p.pub_id

GROUP BY au_lname, au_fname, pub_name

Challenge #3

SELECT au_lname, au_fname, qty
FROM authors as a
LEFT JOIN titleauthor as t
ON a.au_id = t.au_id
INNER JOIN titles as ti
ON t.title_id = ti.title_id
INNER JOIN sales AS s
ON ti.title_id = s.title_id

ORDER BY qty DESC LIMIT 3

Challenge #4

SELECT au_lname, au_fname, qty
FROM authors as a
LEFT JOIN titleauthor as t
ON a.au_id = t.au_id
INNER JOIN titles as ti
ON t.title_id = ti.title_id
INNER JOIN sales AS s
ON ti.title_id = s.title_id

ORDER BY qty DESC

