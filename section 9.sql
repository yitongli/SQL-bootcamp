SELECT COUNT(title) FROM books WHERE title LIKE "%the%"

SELECT CONACT(author_fname, author_lname), COUNT(*) FROM books GROUP by author_fname, author_lname;

SELECT released_year, COUNT(*) FROM books GROUP by released_year; 

SELECT CONCAT(author_fname, author_lname,' is showed ', COUNT(*)) AS Full_name FROM books GROUP by author_fname, author_lname;

SELECT title, pages FROM books WHERE pages=(SELECT MAX(pages) from books);

SELECT title, MIN(released_year) FROM books GROUP by released_year;

SELECT Round(AVG(released_year),2) AS average_year from books;

SELECT AVG(stock_quantity),released_year from books group by released_year;

SELECT released_year,count(*) from books group by released_year;

SELECT sum(stock_quantity) from books;

SELECT round(AVG(released_year),2) AS released_year,CONCAT(author_lname,' ',author_fname) AS full_name from books GROUP by author_lname, author_fname;

SELECT CONCAT(author_lname,' ',author_fname),pages AS full_name FROM books where pages=(SELECT max(pages) from books);

SELECT released_year as year,
count(*) as '# of books',
AVG(pages) AS 'avg_pages'
FROM books GROUP by released_year ORDER BY released_year ASC;
