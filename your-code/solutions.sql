SELECT  ta.au_id as 'AUTHOR ID',
	au_lname AS 'LAST NAME', 
    au_fname AS 'FIST NAME', 
    title AS 'TITTLE', 
    pub_name AS 'PUBLISHER'
FROM titles as t
left join titleauthor as ta
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id

;

//

SELECT 
	ta.au_id AS 'AUTHOR ID',
	au_lname AS 'LAST NAME',
	au_fname AS 'FIRST NAME',
	pub_name AS 'PUBLISER',
	COUNT(*) AS 'TITLE COUNT'
FROM titles AS t
LEFT JOIN titleauthor AS ta
ON t.title_id = ta.title_id
LEFT JOIN authors AS a 
ON a.au_id = ta.au_id
LEFT JOIN publishers AS p 
ON p.pub_id = t.pub_id
GROUP BY ta.au_id, au_lname, au_fname, pub_name

;

//

SELECT ta.au_id AS 'AUTHOR ID',
       au_lname AS 'LAST NAME',
       au_fname AS 'FIRST NAME',
       SUM(s.qty) AS 'TOTAL'
FROM titles AS t
LEFT JOIN titleauthor AS ta 
ON t.title_id = ta.title_id
LEFT JOIN authors AS a 
ON a.au_id = ta.au_id
LEFT JOIN sales as s
ON s.title_id = ta.title_id
GROUP BY ta.au_id, au_lname, au_fname
ORDER BY SUM(s.qty) DESC
LIMIT 3;

//

SELECT

au_lname AS last_name,
au_fname AS first_name,
ifnull(sum(s.qty), 0) AS total

FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id
LEFT JOIN sales AS s
ON s.title_id = t.title_id

GROUP BY a.au_id
ORDER BY total DESC
;