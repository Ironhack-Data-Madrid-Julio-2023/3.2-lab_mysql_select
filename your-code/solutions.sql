SELECT
    authors.au_id AS `AUTHOR ID`,
    authors.au_lname AS `LAST NAME`,
    authors.au_fname AS `FIRST NAME`,
    titles.title AS `TITLE`,
    publishers.pub_name AS `PUBLISHER`
FROM
    authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id 
    JOIN publishers ON titles.pub_id = publishers.pub_id;
    -- resultado com 25 rows

SELECT COUNT(*) as row_count
FROM titleauthor;
    -- checked 25 rows in table titleauthor
    
SELECT authors.au_id AS `AUTHOR ID`,
       authors.au_lname AS `LAST NAME`,
       authors.au_fname AS `FIRST NAME`,
       publishers.pub_name AS `PUBLISHER`,
       COUNT(*) AS `TITLE COUNT`
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;    


SELECT SUM(`TITLE COUNT`) AS `TOTAL COUNT`
FROM (
    SELECT COUNT(*) AS `TITLE COUNT`
    FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN publishers ON titles.pub_id = publishers.pub_id
    GROUP BY authors.au_id, publishers.pub_name
) AS subquery;
-- total count = 25 

SELECT COUNT(*) AS `TOTAL RECORDS`
FROM titleauthor;
-- total count = 25

SELECT authors.au_id AS `AUTHOR ID`,
       authors.au_lname AS `LAST NAME`,
       authors.au_fname AS `FIRST NAME`,
       SUM(sales.qty) AS `TOTAL QTY`
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY `TOTAL QTY` DESC
LIMIT 3;
-- top 3 authors are Anne Ringer 148 , Albert Ringer 133 and M. Green 50

SELECT *
FROM (
  SELECT authors.au_id AS `AUTHOR ID`,
         authors.au_lname AS `LAST NAME`,
         authors.au_fname AS `FIRST NAME`,
         IFNULL(SUM(sales.qty), 0) AS `TOTAL QTY`
  FROM authors
  JOIN titleauthor ON authors.au_id = titleauthor.au_id
  JOIN titles ON titleauthor.title_id = titles.title_id
  LEFT JOIN sales ON titles.title_id = sales.title_id
  GROUP BY authors.au_id, authors.au_lname, authors.au_fname
  UNION ALL
  SELECT authors.au_id AS `AUTHOR ID`,
         authors.au_lname AS `LAST NAME`,
         authors.au_fname AS `FIRST NAME`,
         0 AS `TOTAL QTY`
  FROM authors
  WHERE authors.au_id NOT IN (
      SELECT titleauthor.au_id
      FROM titleauthor
      JOIN titles ON titleauthor.title_id = titles.title_id
      JOIN sales ON titles.title_id = sales.title_id
  )
) AS subquery
ORDER BY `TOTAL QTY` DESC
LIMIT 23;
