
SELECT 
  authors.au_id AS `ID DEL AUTOR`,
  authors.au_lname AS `APELLIDO`, 
  authors.au_fname AS `NOMBRE`, 
  titles.title AS `TÍTULO`, 
  publishers.pub_name AS `EDITORIAL`
FROM 
  authors
INNER JOIN
  titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN
  titles ON titleauthor.title_id = titles.title_id
INNER JOIN
  publishers ON titles.pub_id = publishers.pub_id;
