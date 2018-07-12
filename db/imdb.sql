DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE stars(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR (225),
  last_name VARCHAR (225)
);

CREATE TABLE movies(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR (225),
  genre VARCHAR (225)
);

CREATE TABLE castings(
  id SERIAL8 PRIMARY KEY,
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
  fee INT4
);
