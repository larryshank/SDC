CREATE DATABASE qa;

\c qa;

CREATE TABLE IF NOT EXISTS questions (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  product_id integer,
  body text,
  date_written bigint,
  asker_name varchar(255),
  asker_email varchar(255),
  reported integer DEFAULT 0,
  helpful integer DEFAULT 0
);

CREATE TABLE IF NOT EXISTS answers (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  question_id integer,
  body text,
  date_written bigint,
  answerer_name varchar(255),
  answerer_email varchar(255),
  reported integer DEFAULT 0,
  helpful integer DEFAULT 0
);

CREATE TABLE IF NOT EXISTS answers_photos (
  id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  answer_id integer,
  url text
);

create index answer_id on answers_photos(answer_id);

create index question_id on answers(question_id);

create index product_id on questions(product_id);

