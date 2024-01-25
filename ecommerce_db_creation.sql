create table users
(
user_id INT PRIMARY KEY NOT NULL,
username varchar(50) NOT null,
email varchar(50) ,
joined_on datetime 
);

create table countries
(
c_name varchar(30) NOT null,
country_code int 
);

create table products1
(
p_id INT PRIMARY KEY NOT NULL,
p_name varchar(40) NOT null,
price float ,
stock int
);

create table orders1
(
o_id INT Primary key not null,
user_id INT foreign key references users(user_id),
ord_date datetime,
total_amount float
);

create table reviews
( 
r_id INT Primary key not null,
user_id INT foreign key references users(user_id),
p_id INT foreign key references products1(p_id),
comments varchar(100) ,
review_date datetime
);

ALTER TABLE orders1
ADD CONSTRAINT users_user_id_orders1
FOREIGN KEY (user_id)
REFERENCES users(user_id);

ALTER TABLE reviews
ADD CONSTRAINT users_user_id_reviews
FOREIGN KEY (user_id)
REFERENCES users(user_id);

ALTER TABLE reviews
ADD CONSTRAINT products_p_id_reviews
FOREIGN KEY (p_id)
REFERENCES products1(p_id);

