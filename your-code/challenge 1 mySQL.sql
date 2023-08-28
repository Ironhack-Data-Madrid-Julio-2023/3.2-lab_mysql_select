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
LIMIT 3

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
 
    /*CHALLENGE 1, Lab_Advanced MySQL*/
    
SELECT CAST(qty AS FLOAT) AS qty
FROM sales;
SELECT CAST(royalty AS FLOAT) AS royalty
FROM titles;
SELECT CAST(royaltyper AS FLOAT) AS royaltyper
FROM titleauthor;
SELECT 
  sales.`qty`,
  titles.`royalty`,
    
    sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100