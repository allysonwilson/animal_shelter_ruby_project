DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS heros;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  species VARCHAR(255),
  adoption_month DATE,
  adoptable BOOLEAN
);

CREATE TABLE heros
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  
)