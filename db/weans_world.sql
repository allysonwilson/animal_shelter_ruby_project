DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS heros;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals
(
  id SERIAL8 primary key,
  species VARCHAR(255),
  adoption_month DATE,
  adoptable BOOLEAN
);

CREATE TABLE heros
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
animal_id INT8 references animals(id),
hero_id INT8 references heros(id)
);
