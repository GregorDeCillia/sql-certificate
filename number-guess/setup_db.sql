--!/bin/psql

CREATE DATABASE number_guess;
\c number_guess;

CREATE TABLE players(
  player_id SERIAL PRIMARY KEY,
  name VARCHAR(22) NOT NULL
);

CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  player_id INT REFERENCES players(player_id) NOT NULL,
  guesses INT NOT NULL
);
