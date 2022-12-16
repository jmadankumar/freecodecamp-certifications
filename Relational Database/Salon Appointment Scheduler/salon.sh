#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ My Salon ~~~~~"

SALON_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else 
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  # display services
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
  # get the service id
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # does not exist
  if [[ -z $SERVICE_NAME ]]
  then
    # send to salon menu
    SALON_MENU "I could not find that service. What would you like today?"
  else
    # if exist get phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # if customer exist
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # customer not exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

    fi
    
    # Insert customer
    CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # get appointment time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    

    # Insert appointment
    APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")

    # display confirmation
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  
  

}

SALON_MENU