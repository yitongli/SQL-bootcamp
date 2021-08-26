create table reviewers(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE series(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year year(4), 
    genre VARCHAR(100)
);

create table reviews(
    id int AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id int, 
    FOREIGN KEY(series_id) REFERENCES series(ID),
    reviewer_id int,
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(ID)
);

select title,AVG(rating) from series
join reviews
    on series.id = reviews.series_id
group by title
ORDER BY rating ASC;

select first_name, last_name,rating
from reviewers
INNER join reviews on reviewers.ID = reviews.reviewer_id;

select title as unreviewed_series
from series
left join reviews on series.ID = reviews.series_id
where rating is NULL;

select AVG(rating) as avg_rating,genre
from reviews
inner join series on  reviews.series_id = series.ID
group by genre;

select first_name,last_name,
IFNULL(count(rating),'0')as COUNT,
IFNULL(MIN(rating), '0')AS MIN,
IFNULL(MAX(rating),'0') AS MAX,
IFNULL(AVG(rating),'0')  as AVG,
IF(AVG(rating)>0,'ACTIVE','INACTIVE') as status
from reviewers
LEFT join reviews on reviewers.ID = reviews.reviewer_id
group by first_name,last_name;

select title,rating,CONCAT(first_name,' ',last_name) as reviewers
from reviews
inner join reviewers on reviewers.ID = reviews.reviewer_id
inner join series on reviews.series_id = series.ID;
