# Worldcup Database

My soltion for the [build a wordcup database](https://www.freecodecamp.org/learn/relational-database/build-a-world-cup-database-project/build-a-world-cup-database) project.

- `setup.sql` initializes the requied tables and columns
- `insert_data.sh` copies data from `games.csv` to postgres (tables games and teams)
- `worldcup.sql` was generated via postgres (`pg_dump`) after the setup/inserts
- `query.sh` runs queries on the database
