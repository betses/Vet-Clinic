/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2-3-2020', 0, true, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '11-15-2018', 2, true, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '1-7-2021', 1, false, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '5-12-2017', 5, true, 11);


insert into animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
values  (5, 'Charmander', '2020-02-08', 0, FALSE, -11),
        (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),
        (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13),
        (8, 'Angemon', '2005-06-12', 1, TRUE, -45),
        (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4),
        (10, 'Blossom', '1998-10-13', 3, TRUE, 17),
        (11, 'Ditto', '2022-05-14', 4, TRUE, 22);


INSERT INTO owners (full_name, age)
VALUES  ('Sam Smith', 34), ('Jennifer Orwell', 19),
        ('Bob', 45), ('Melody Pond', 77),
        ('Dean Winchester', 14), ('Jodie Whittaker', 38);

-- Inserting two(2) data into the 'species' table
INSERT INTO species (name) VALUE ('Pokemon'), ('Digimon');

/* Modifying 'species_id' in 'animals' table with the following values:
   If the name ends in 'mon', it will be 'Digimon'
   All other animals are 'Pokemon'
*/
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modifying 'owner_id' in animals to reflect the following info
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

/* Inserting four(4) data into the 'vets' table
   Each data having a name, age, and date_of_graduation
*/
INSERT INTO vets (name, age, date_of_graduation)
VALUES  ('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),
        ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

/* Inserting three(3) data into the 'specializations' table
   Each data having a vet_id, and species_id
*/
INSERT INTO specializations (vet_id, species_id)
VALUES  (1, 1), (3, 2),
        (3, 1), (4, 2);

/* Inserting twenty(20) data into the 'visits' table
   Each data having a animal_id, vet_id, and date_visited
*/
INSERT INTO visits (animal_id, vet_id, date_visited)
VALUES  (2, 2, '2019-01-24'), (2, 2, '2019-05-15'),
        (1, 3, '2019-09-29'), (2, 2, '2019-12-21'),
        (1, 2, '2020-01-05'), (2, 2, '2020-02-27'),
        (1, 2, '2020-03-08'), (1, 2, '2020-05-14'),
        (2, 1, '2020-05-24'), (1, 3, '2020-05-24'),
        (2, 3, '2020-07-22'), (2, 2, '2020-08-03'),
        (2, 1, '2020-08-10'), (2, 4, '2020-10-03'),
        (2, 4, '2020-11-04'), (1, 1, '2021-01-11'),
        (2, 4, '2021-02-02'), (1, 4, '2021-02-24'),
        (2, 2, '2021-04-07'), (2, 3, '2021-05-04');