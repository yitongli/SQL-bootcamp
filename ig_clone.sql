CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) UNIQUE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    create_at TIMESTAMP DEFAULT NOW()

);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

create table tags(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

create TABLE photo_tags(
    photo_id int not null,
    tag_id int not NULL,
    foreign key (photo_id) REFERENCES photos(ID),
    FOREIGN KEY (tag_id) REFERENCES tags(ID),
    PRIMARY key (photo_id,tag_id)
);

CREATE TABLE likes (
    
     INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

--find the 5 oldest users

select * from users
order by created_at ASC
LIMIT 5;

--what day of the week do most user register on

SELECT DAYNAME(created_at),count(DAYNAME(created_at)) AS DAYNAME
from users
group by DAYNAME(created_at)
order by COUNT(DAYNAME(created_at)) ASC;

--target inactive users

select users.id, photos.user_id 
from users
left join photos
    on users.id = photos.user_id
where photos.user_id is null;

--find the photo with most likes

select photos.id,photos.image_url,count(*),photos.user_id,username
from photos
inner JOIN likes on likes.photo_id = photos.id 
inner JOIN users on users.id = photos.user_id
group by photos.id
order by count(*) DESC
LIMIT 1;

--how many times does the average user post?

---select user_id, count(*) AS total,AVG(count(*))
---from photos
---group by user_id;

SELECT
(select count(*) from photos)/
(select count(*)from users);


--top 5 most commonly used hashtags

select 
photo_tags.tag_id, count(*),
tags.id, tags.tag_name
from photo_tags
inner join tags on photo_tags.tag_id = tags.ID
group by photo_tags.tag_id
order by count(*) DESC
LIMIT 5;

--find users who liked every single photo

select username, count(*) as num_likes
FROM users
inner join likes on users.id = likes.user_id
group by users.id
having num_likes = (select count(*) from photos);
