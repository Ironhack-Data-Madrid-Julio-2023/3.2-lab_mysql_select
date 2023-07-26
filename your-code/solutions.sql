-- Challenge 1

select 
authors.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER'

from authors

join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id;

-- Challenge 2

SELECT authors.au_id AS 'AUTHOR ID',
       authors.au_lname AS 'LAST NAME',
       authors.au_fname AS 'FIRST NAME',
       publishers.pub_name AS 'PUBLISHER',
       count(titles.title_id) 'TITLE COUNT'
     
       
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_name;

-- Challenge 3

SELECT

authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
sum(sales.qty) AS 'TOTAL'

FROM authors

JOIN titleauthor on authors.au_id=titleauthor.au_id
JOIN titles on titles.title_id=titleauthor.title_id
JOIN sales on titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3

-- Challenge 4

SELECT

authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
COALESCE(sum(sales.qty),0) AS 'TOTAL'

FROM authors

LEFT JOIN titleauthor on authors.au_id=titleauthor.au_id
LEFT JOIN titles on titles.title_id=titleauthor.title_id
LEFT JOIN sales on titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY COALESCE(sum(sales.qty),0) DESC