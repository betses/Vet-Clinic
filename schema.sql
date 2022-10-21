/* Database schema to keep the structure of entire database. */
create DATABASE vet_clinic;

CREATE TABLE animals(
  id INT,
  name VARCHAR(50),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DEC,
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD species TEXT;

/* Creating 'Owners' table in 'vet_clinic' database
   Table has columns: id, full_nam, and age
*/
CREATE TABLE owners (
    id  BIGSERIAL  NOT NULL,
    full_name   TEXT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

/* Creating 'Species' table in 'vet_clinic' database
   Table has columns: id, and name
*/
CREATE TABLE species (
    id  BIGSERIAL  NOT NULL,
    name   TEXT NOT NULL,
    PRIMARY KEY(id)
);

-- Modify 'animals' table and set id as autoincrementedprimary key
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

-- Remove 'species' column from 'animals' table
ALTER TABLE animals DROP COLUMN species;

/* Add 'species_id' column to animals table with foreign
   key referencing 'species' table
*/
ALTER TABLE animals ADD COLUMN species_id INT references species(id);

/* Add 'owner_id' column to animals table with foreign
   key referencing 'owners' table
*/
ALTER TABLE animals ADD COLUMN owner_id INT references owners(id);
