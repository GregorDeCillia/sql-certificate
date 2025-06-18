#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT * FROM services")
echo "Available services:"
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  echo "$SERVICE_ID) $SERVICE_NAME"
done
echo -e "\nWhich service would you like to book?"
read SERVICE_ID
if [[ ! $SERVICE_ID =~ ^[0-9]+$ ]]
then
  echo "That is not a valid service number"
else
  SERVICE_AVAILABLE=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID")
  if [[ -z $SERVICE_AVAILABLE ]]
  then
    echo "Invalid service"
  else
    echo "Valid service"
  fi
fi
