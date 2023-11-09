/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

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