-- Challenge 1

select 
authors.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER '

from authors

join titleauthor on titleauthor.au_id=authors.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on publishers.pub_id = titles.pub_id;