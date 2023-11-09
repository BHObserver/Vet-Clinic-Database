/* Database schema to keep the structure of entire database. */

CREATE TABLE vet_clinic.animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(8, 2)
);