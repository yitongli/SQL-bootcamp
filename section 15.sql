select * from users
where created_at = (
    select created_at from users
    order by created_at DESC
    LIMIT 1
);

select MONTHNAME(created_at) as monthname,count(*) 
from users
group by monthname
order by monthname;


SELECT 
    CASE   
        when email LIKE "%yahoo%" then 'yahoo_users'
        when email LIKE "%gmail%" then 'gmail_users'
        when email LIKE "%hotmail%" then 'hotmail_users'
        else 'other'
    end as 'Provider',
    count(email) as total_users
from users
group by Provider;
