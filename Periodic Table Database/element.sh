#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# main function
MAIN_PROGRAM() {
  if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  else
    GET_ELEMENT $1
  fi
}

# get element details from the database
GET_ELEMENT() {
  # check if number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SELECT_DATA=$($PSQL "SELECT e.atomic_number, e.symbol, types.type,e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e LEFT JOIN properties AS p USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
    if [[ -z $SELECT_DATA ]]
    then
      echo -e "I could not find that element in the database."
    else
      PRINT_OUTPUT $SELECT_DATA
    fi
  fi

  # check not number
  if [[ ! $1 =~ ^[0-9]+$  ]]
  then 
    SELECT_DATA=$($PSQL "SELECT e.atomic_number, e.symbol, types.type,e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e LEFT JOIN properties AS p USING(atomic_number) LEFT JOIN types USING(type_id) WHERE e.symbol='$1' OR e.name='$1'")
    if [[ -z $SELECT_DATA ]]
    then
      echo -e "I could not find that element in the database."
    else
      PRINT_OUTPUT $SELECT_DATA
    fi
  fi
}

# print the output
PRINT_OUTPUT () {
  echo $1 | while IFS="|" read NUMBER SYMBOL TYPE NAME ATOMIC_MASS MELTING BOILING
  do
    echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
}

# start program
MAIN_PROGRAM $1
