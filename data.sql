/* Populate database with sample data. */

INSERT INTO ANIMALS
    VALUES
     (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
     (2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
     (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
     (4, 'Devimon', '2017-05-12', 5, TRUE, 11);


-- Animal 1
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Charmander', '2020-02-08', 11, FALSE, 0, 'Unknown');

-- Animal 2
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Plantmon', '2021-11-15', 5.7, TRUE, 2, 'Unknown');

-- Animal 3
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Squirtle', '1993-04-02', 12.13, FALSE, 3, 'Unknown');

-- Animal 4
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Angemon', '2005-06-12', 45, TRUE, 1, 'Unknown');

-- Animal 5
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Boarmon', '2005-06-07', 20.4, TRUE, 7, 'Unknown');

-- Animal 6
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Blossom', '1998-10-13', 17, TRUE, 3, 'Unknown');

-- Animal 7
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Ditto', '2022-05-14', 22, TRUE, 4, 'Unknown');

-- Insert data into the owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
SELECT * FROM owners;

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
SELECT * FROM species;

-- Update animals to include owner_id based on the owner's name
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
SELECT * FROM animals;
COMMIT;
