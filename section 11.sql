select title,released_year,author_lname from books
where released_year >= 2000 and author_lname = 'Eggers'
order by released_year;

SELECT * 
FROM books
WHERE author_lname='Eggers' 
    OR released_year > 2010 
    OR title LIKE '%novel%';

select title, released_year from books
where released_year NOT between 2004 and 2005;

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME); --case converts a value (of any type) into a specified datatype.

SELECT title, released_year from books
where released_year % 2 !=0 
and released_year > 2000; --% remainder

SELECT title,stock_quantity,
    CASE
     WHEN stock_quantity <= 50 THEN '*'
     WHEN stock_quantity <= 100 THEN '**'
     ELSE '***'
    END AS STOCK
FROM books;

0; 1;1;

SELECT title,released_year from books
where released_year <1980;

SELECT title, author_lname from books
where author_lname LIKE "%Eggers%" OR author_lname LIKE "%Chabon%";
--where author_lname IN ('Eggers','Chabon')

SELECT title,author_lname,released_year from books
where released_year >2000
AND author_lname like "%Lahiri%";

SELECT title,pages from books
where pages BETWEEN 100 and 200; 

select title,author_lname from books
where author_lname like "C%"
OR author_lname like "S%";

SELECT title, author_lname,
    CASE 
      WHEN title like "%stories" then "Short Stories"
      WHEN title like "%Just Kids%" or title like "%Heartbreaking%" then 'Memoir'
      ELSE 'Novel'
    END AS TYPE
FROM books;

select title, author_lname, 
CONCAT(
    count(*),
    CASE 
        WHEN count(*) >1 THEN " books"
        ELSE " book"
    END 
 )AS COUNT
from books
GROUP BY author_lname
ORDER BY author_lname;
