/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


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

START TRANSACTION;
UPDATE animals
    SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

START TRANSACTION;
    UPDATE animals
        SET species = 'digimon'
        WHERE name LIKE '%mon';
    UPDATE animals
        SET species = 'pokemon'
        WHERE species IS NULL;
    UPDATE animals
        SET species = 'pokemon'
        WHERE species = 'Unknown';

START TRANSACTION;
    DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

START TRANSACTION;
    DELETE FROM animals
    WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

    UPDATE animals
    SET weight_kg = weight_kg * -1;

ROLLBACK TO my_savepoint;
    
    UPDATE animals
        SET weight_kg = weight_kg * -1
        WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS non_escape_animals
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_weight
FROM animals;

SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;