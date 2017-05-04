BEGIN;

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id          SERIAL        PRIMARY KEY,
  firstname   VARCHAR(30)   NOT NULL,
  lastname    VARCHAR(50),
  facebook_id INTEGER       UNIQUE,
  postcode    VARCHAR(10)
);

INSERT INTO users (firstname, lastname, facebook_id, postcode)
VALUES
('Maja', 'Kudlicka', 517916098, 'E2 0ET'),
('Alice', 'BC', 517916097, 'E1 4UF');

COMMIT;