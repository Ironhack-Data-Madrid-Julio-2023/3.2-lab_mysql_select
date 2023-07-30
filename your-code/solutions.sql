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

