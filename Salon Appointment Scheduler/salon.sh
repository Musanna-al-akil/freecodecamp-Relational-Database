#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

SERVICE_MENU() {
  if [[ -z $1 ]] 
  then
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  # get all services
  ALL_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # show services
  echo "$ALL_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # read service input
  read SERVICE_ID_SELECTED

  # check the input
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if not found
  if [[ -z $SERVICE_ID ]]
  then
    # redirect to mein menu 
    SERVICE_MENU "I could not find that service. What would you like today?"
  else
    # if found
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    # read phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # check user phone number
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    then
      # if not found
      echo -e "\nI don't have a record for that phone number, what's your name?"
      # read user name
      read CUSTOMER_NAME
      # insert new user
      INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      # get user id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
    fi
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")

    # read time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?"
    
    read SERVICE_TIME
    
    # insert new appoinment
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID,'$SERVICE_TIME')")
    # if success
    if [[ $INSERT_NEW_APPOINTMENT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a  $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
 

}

SERVICE_MENU
