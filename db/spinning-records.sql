DROP TABLE albums;
DROP TABLE artists;
DROP TABLE genres;


CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE genres (
  id serial4 primary key,
  type varchar(255)
);

CREATE TABLE albums (
  id serial4 primary key,
  name varchar(255) NOT NULL,
  quantity int2,
  artist_id int4 references artists(id),
  buy_price int2,
  sell_price int2,
  genre_id int4 references genres(id)
);
