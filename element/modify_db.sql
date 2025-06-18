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

ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);
UPDATE elements SET symbol=initcap(symbol);

ALTER TABLE properties ALTER atomic_mass SET DATA TYPE REAL;

-- TODO: more automation for this upcoming normalization
--       https://stackoverflow.com/q/1293330/4357017
CREATE TABLE types();
ALTER TABLE types ADD COLUMN type_id INT PRIMARY KEY;
ALTER TABLE types ADD COLUMN type VARCHAR NOT NULL;

INSERT INTO types(type_id, type) VALUES
  (1, 'metal'), (2, 'nonmetal'), (3, 'metalloid');
ALTER TABLE properties ADD COLUMN type_id INT REFERENCES types(type_id);
UPDATE properties SET type_id=1 WHERE type='metal';
UPDATE properties SET type_id=2 WHERE type='nonmetal';
UPDATE properties SET type_id=3 WHERE type='metalloid';
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties DROP COLUMN type;

-- manual inserts according to exercise instructions
INSERT INTO elements(atomic_number, symbol, name) VALUES
  (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');

INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius,
                       boiling_point_celsius, type_id) VALUES
  (9, 18.998, -220, -188.1, 2),
  (10, 20.18, -248.6, -246.1, 2);

