-- creating dimension tables 

create table date_dim(
	date_key int not null primary key,
	date date not null,
	year smallint not null,
	quarter smallint not null,
	month smallint not null,
	week smallint not null,
	day smallint not null,
	is_weekened boolean
);

select * from information_schema.columns where table_name='date_dim';
select column_name, data_type from information_schema.columns where table_name='date_dim';

create table customer_dim(
	customer_key serial primary key,
	customer_id smallint not null,
	first_name varchar not null,
	last_name varchar not null,
	email varchar,
	address1 varchar,
	address2 varchar,
	district varchar,
	city varchar,
	country varchar,
	postal_code varchar(10),
	phone varchar(20) not null,
	active smallint,
	create_date timestamp,
	start_date date,
	end_date date
);

create table movie_dim(
	movie_key int not null primary key,
	film_id int,
	title varchar,
	description varchar,
	release_year smallint,
	language varchar,
--	original_language varchar,
	rental_duration smallint,
	length int,
	rating varchar,
	special_features varchar
);

create table store_dim(
	store_key int not null primary key,
	store_id smallint,
	address1 varchar,
	address2 varchar,
	district varchar,
	city varchar,
	country varchar,
	postal_code varchar,
	manager_first_name varchar,
	manager_last_name varchar,
	start_date date,
	end_date varchar
);

--creating fact table sales

create table sales_fact(
	sales_key serial primary key,
	date_key int references date_dim(date_key),
	customer_key int references customer_dim(customer_key),
	movie_key int references movie_dim(movie_key),
	store_key int references store_dim(store_key),
	store_amount numeric
);


drop table customer_dim;
drop table movie_dim;
drop table sales_fact;







