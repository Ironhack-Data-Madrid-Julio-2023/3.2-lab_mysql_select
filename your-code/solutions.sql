-- Challenge 1
SELECT
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.title AS 'TITLE',
publishers.pub_name AS 'PUBLISHER'

FROM AUTHORS 

JOIN 
	titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
	titles ON titleauthor.title_id = titles.title_id
JOIN 
	publishers ON titles.pub_id = publishers.pub_id;
    
-- Challenge 2
SELECT
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title_id) AS 'TITLE COUNT'

FROM
	authors

JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id;

-- Challenge 3
SELECT  titleauthor.au_id AS au_id,
        max(au_fname) AS first_name,
        max(au_lname) AS last_name,
        max(pub_name),
        sum(qty)
FROM titleauthor
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN authors
ON authors.au_id = titleauthor.au_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
RIGHT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id
ORDER BY sum(qty) DESC
LIMIT 3;

-- Challenge 4
SELECT  titleauthor.au_id AS au_id,
        max(au_fname) AS first_name,
        max(au_lname) AS last_name,
        max(pub_name),
        sum(qty)
FROM titleauthor
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN authors
ON authors.au_id = titleauthor.au_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
RIGHT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id;