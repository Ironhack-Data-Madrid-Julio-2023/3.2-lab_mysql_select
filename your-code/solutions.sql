USE PUBLICATIONS;

SELECT ta.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME' , t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM titles AS t, titleauthor AS ta, publishers AS p, authors as a
WHERE t.title_id = ta.title_id AND  t.pub_id = p.pub_id and ta.au_id = a.au_id;
 
SELECT ta.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME',a.au_fname AS 'FIRST NAME', COUNT(ta.title_id) AS 'TITLE COUNT'
FROM titles AS t, titleauthor AS ta, publishers AS p, authors AS a
WHERE t.title_id = ta.title_id AND t.pub_id = p.pub_id AND ta.au_id = a.au_id
GROUP BY ta.au_id, a.au_lname, a.au_fname
ORDER BY ta.au_id ASC;

SELECT ta.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME',a.au_fname AS 'FIRST NAME', COUNT(ta.title_id) AS 'TITLE COUNT'
FROM titles AS t, titleauthor AS ta, publishers AS p, authors AS a
WHERE t.title_id = ta.title_id AND t.pub_id = p.pub_id AND ta.au_id = a.au_id
GROUP BY ta.au_id, a.au_lname, a.au_fname
ORDER BY ta.au_id desc
limit 3;

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COALESCE(COUNT(ta.title_id), 0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY COALESCE(COUNT(ta.title_id), 0) DESC;