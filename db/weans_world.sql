DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS heroes;
DROP TABLE IF EXISTS animals;

CREATE TABLE animals
(
  id SERIAL8 primary key,
  species VARCHAR(255),
  adoption_month VARCHAR(255),
  adoptable BOOLEAN,
  image VARCHAR(255)
);

CREATE TABLE heroes
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  image VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
animal_id INT8 references animals(id) ON DELETE CASCADE,
hero_id INT8 references heroes(id) ON DELETE CASCADE
);
