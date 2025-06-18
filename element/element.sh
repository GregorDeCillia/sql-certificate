#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1");
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'");
  if [[ -z $ATOMIC_NUMBER ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'");
  fi
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
    exit
  fi
fi

QUERY_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")

echo $QUERY_RESULT | while read I BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
done

