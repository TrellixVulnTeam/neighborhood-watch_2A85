DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS report CASCADE;
DROP TABLE IF EXISTS comment CASCADE;

CREATE TABLE person(
   id SERIAL PRIMARY KEY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   email VARCHAR(255) NOT NULL,
   person_password VARCHAR(255) NOT NULL,
   person_address VARCHAR(255) NOT NULL
);

CREATE TABLE report(
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  date_time timestamp without time zone NOT NULL,
  report TEXT NOT NULL,
  report_address VARCHAR(255) NOT NULL,
  up_vote INTEGER NOT NULL,
  down_vote INTEGER NOT NULL,
  person_id INTEGER REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE comment(
  id SERIAL PRIMARY KEY NOT NULL,
  comment VARCHAR(255) NOT NULL,
  person_id INTEGER REFERENCES person(id)  ON DELETE CASCADE,
  report_id INTEGER REFERENCES report(id) ON DELETE CASCADE
);