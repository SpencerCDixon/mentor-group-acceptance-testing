create table users(
  id serial primary key,
  username varchar(255) not null,
  password varchar(255) not null
);

create table status(
  id serial primary key,
  body varchar(255) not null,
  user_id integer not null
);
