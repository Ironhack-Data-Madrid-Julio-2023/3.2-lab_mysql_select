'''Challenge 1 '''

select  ta.au_id,
        au_fname as first_name,
        au_lname as last_name,
        title,
        pub_name
        
from titleauthor as ta left join titles as t on t.title_id = ta.title_id

left join authors as a
on a.au_id = ta.au_id

left join publishers as p
on p.pub_id = t.pub_id
;

'''
Explicación de FROM, para el humano primero se ejecuta la sentencia FROM, que es el nombre de la tabla
con AS cambiamos de nombre a la tabla para hacerla más corta, 
LEF JOIN, juntamos la anterior tabla, es decir, tittle author con tittles
ON en dónde la FK  sean iguales,  es decir, t.ttile_id = ta_tittle_id la FK es tittle_id

El resutlado de esta nueva consulta lo relaciono con la tabla author con el left join 
finalmente este resultado se relaciona con la tabla publisher 

Finalmente con SELECT, seleccionamos el nombre de las columnas y con AS cambiamos el nombre de las mismas

'''


/* SEGUNDA FORMA */
SELECT ta.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME' , t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM titles AS t, titleauthor AS ta, publishers AS p, authors as a
WHERE t.title_id = ta.title_id AND  t.pub_id = p.pub_id and ta.au_id = a.au_id;

'''Explicación
Primero seleccionamos las tablas que queremos relacionar con FROM en este caso son 4
tittles(t), tittleauthor(ta), publisher(p)y authors(a), con AS abreviamos el nombre

Segundo usamos el filtro WHERE, para consultar unicamente lo que deseamos, 
observamos las relaciones es decir, las FK de las tablas tittles y tittles author
es la columna tittle_id

De la misma forma, las FK de las tablas tittle (t) y publisher (p) es la columna pub_id
Finalmente la FK de tal tabla tittle author(ta) y la tabla author(a) es au_id

'''


''' Challenge 2 '''


SELECT authors.au_id AS 'AUTHOR ID',
       authors.au_lname AS 'LAST NAME',
       authors.au_fname AS 'FIRST NAME',
       publishers.pub_name AS 'PUBLISHER',
       count(titles.title_id) 'TITLE COUNT'
     
       
FROM titleauthor

RIGHT JOIN  authors ON authors.au_id = titleauthor.au_id
RIGHT JOIN titles ON titleauthor.title_id = titles.title_id
RIGHT JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_name;

''' Explicación

Desde la tabla tittleauthor realizamos los joins con las otras columnas
primeramente se relaciona con la tabla authors, dónde comparten la FK en au_id
después la tabla tittleauthor se relaciona con la  tabla tittles dónde comparten
como FK en  tittle.id.

Finalmente la tabla titles se relaciona con la tabla publisher 
dónde comparten como FK la columna pub_id

Finalmente con SELECT se renombra las tablas-columnas,
authors.au_id(tabla authors, columna au_id)pasa a llamarse Author ID
 
 

  Segunda forma'''

SELECT ta.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME',a.au_fname AS 'FIRST NAME', COUNT(ta.title_id) AS 'TITLE COUNT'

FROM titles AS t, titleauthor AS ta, publishers AS p, authors AS a

WHERE t.title_id = ta.title_id AND t.pub_id = p.pub_id AND ta.au_id = a.au_id

GROUP BY ta.au_id, a.au_lname, a.au_fname
ORDER BY ta.au_id ASC;

''' En lugar de usar los joins, usamos el filtro where en dónde damos las condiciones
que deseamos '''


''' Challenge 3 '''


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

''' Segunda forma '''
SELECT ta.au_id AS 'AUTHOR ID',a.au_lname AS 'LAST NAME',a.au_fname AS 'FIRST NAME', COUNT(ta.title_id) AS 'TITLE COUNT'
FROM titles AS t, titleauthor AS ta, publishers AS p, authors AS a
WHERE t.title_id = ta.title_id AND t.pub_id = p.pub_id AND ta.au_id = a.au_id
GROUP BY ta.au_id, a.au_lname, a.au_fname
ORDER BY ta.au_id desc
limit 3;



''' Challenge 4 '''
select  ta.au_id as au_id,
        max(au_fname) as first_name,
        max(au_lname) as last_name,
        count(title),
        max(pub_name),
        sum(qty) as qty

from titleauthor as ta

left join titles as t
on t.title_id = ta.title_id
left join authors as a
on a.au_id = ta.au_id
left join publishers as p
on p.pub_id = t.pub_id
right join sales as s
on s.title_id = ta.title_id

group by ta.au_id;

'''Segunda forma'''
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COALESCE(COUNT(ta.title_id), 0) AS 'TOTAL'
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY COALESCE(COUNT(ta.title_id), 0) DESC;