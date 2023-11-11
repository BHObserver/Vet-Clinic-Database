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
COMMIT;

START TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;


START TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
COMMIT;

START TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;
SELECT * FROM animals;
COMMIT;

UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
COMMIT;

ROLLBACK TO my_savepoint;    
SELECT * FROM animals;
COMMIT;

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

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';


SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name AS animal_name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

SELECT s.name AS species_name, COUNT(*) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name AS digimon_name
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.id) AS animal_count
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT a.name AS last_animal_seen
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;


SELECT COUNT(DISTINCT v.animal_id) AS num_animals_seen
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

SELECT vt.name AS vet_name, s.name AS specialty
FROM vets vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;

SELECT a.name AS animal_name
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
WHERE vt.name = 'Stephanie Mendez'
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name AS most_visited_animal
FROM visits v
JOIN animals a ON v.animal_id = a.id
GROUP BY v.animal_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT a.name AS first_visit_animal
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.name AS animal_name, vt.name AS vet_name, v.visit_date AS visit_date
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT s.name AS suggested_specialty
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
JOIN species s ON a.species_id = s.id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.species_id
ORDER BY COUNT(*) DESC
LIMIT 1;
