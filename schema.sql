/* Database schema to keep the structure of entire database. */

CREATE TABLE vet_clinic.animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(8, 2),
    species VARCHAR(100)
);

CREATE TABLE owners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE species (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

SELECT * FROM animals;

-- Create the vets table
CREATE TABLE vets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    date_of_graduation DATE
);

