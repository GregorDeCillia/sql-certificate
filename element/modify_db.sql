ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(name);

ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

DELETE FROM elements WHERE atomic_number=1000;
DELETE FROM properties WHERE atomic_number=1000;

CREATE TABLE types();
ALTER TABLE types ADD COLUMN type_id INT PRIMARY KEY;
ALTER TABLE types ADD COLUMN type VARCHAR NOT NULL;

ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
UPDATE elements SET symbol=initcap(symbol);

ALTER TABLE properties ALTER atomic_mass SET DATA TYPE REAL;

