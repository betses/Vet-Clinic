/* Database schema to keep the structure of entire database. */
create DATABASE vet_clinic;

CREATE TABLE animals(
  id INT,
  name VARCHAR(50),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DEC
);

ALTER TABLE animals ADD species CHAR(50);


