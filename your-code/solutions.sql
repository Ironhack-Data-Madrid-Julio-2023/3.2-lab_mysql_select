/*CHALLENGE 1, LAB_mySQL_SELECT*/
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
  
  /*CHALLENGE 2, LAB_mySQL_SELECT 'cuantos titulos el autor ha publicado con las editoriales'
  
SELECT 
  authors.au_id AS `ID DEL AUTOR`,
  authors.au_lname AS `APELLIDO`, 
  authors.au_fname AS `NOMBRE`, 
  publishers.pub_name AS `EDITORIAL`,
  count(*) AS `NUM LIBROS`
  
  
FROM 
  authors
INNER JOIN
  titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN
  titles ON titleauthor.title_id = titles.title_id
INNER JOIN
  publishers ON titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

  /*CHALLENGE 3, LAB_mySQL_SELECT 'los 3 autores que más han vendido ordenados de mas a menos'*/
  CREATE TEMPORARY TABLE autores
 SELECT 
  authors.au_id AS `ID DEL AUTOR`,
  authors.au_lname AS `APELLIDO`, 
  authors.au_fname AS `NOMBRE`, 
  publishers.pub_name AS `EDITORIAL`,
  count(*) AS `NUMLIBROS`
  
  
FROM 
  authors
INNER JOIN
  titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN
  titles ON titleauthor.title_id = titles.title_id
INNER JOIN
  publishers ON titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;
 
SELECT 
  `ID DEL AUTOR`, `NOMBRE`, `APELLIDO`
FROM 
  autores
ORDER BY 
  `NUMLIBROS` DESC
LIMIT 3;


 /*CHALLENGE 4, LAB_mySQL_SELECT 'los 23 autores ordenados de mas a menos ventas. Hat que mostrar 0 en lugar de Null para los que no han vendido ningún libro.'*/

SELECT 
  autores.`ID DEL AUTOR`,
  autores.`NOMBRE`,
  autores.`APELLIDO`,
  COALESCE(sales_totals.TOTAL, 0) AS `TOTAL`
FROM 
  autores
LEFT JOIN
  (
    SELECT 
      titleauthor.au_id AS `ID DEL AUTOR`,
      COUNT(sales.qty) AS `TOTAL`
    FROM 
      titleauthor
    LEFT JOIN
      sales ON titleauthor.title_id = sales.title_id
    GROUP BY 
      titleauthor.au_id
  ) AS sales_totals
ON 
  autores.`ID DEL AUTOR` = sales_totals.`ID DEL AUTOR`
ORDER BY 
  `TOTAL` DESC;
 

