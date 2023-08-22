#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Listar todos os serviços cadastrados
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services") 
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo $SERVICE_ID") "$SERVICE_NAME

  done
  
  # ler qual o serviço escolihido
  read SERVICE_ID_SELECTED

  SERVICE_CHOSEN_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_CHOSEN_RESULT ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"

  else
    echo -e "\nWhat's your phone number?"

    read CUSTOMER_PHONE

    PHONE_NUMBER_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $PHONE_NUMBER_RESULT ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_COSTUMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id  FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $(echo $SERVICE_CHOSEN_RESULT | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)")
    SERVICE_CHOSEN_RESULT_FORMATED=$(echo $SERVICE_CHOSEN_RESULT | sed -r 's/^ *| *$//g')
    SERVICE_TIME_FORMATED=$(echo $SERVICE_TIME | sed -r 's/^ *| *$//g')
    CUSTOMER_NAME_FORMATED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
    echo -e "\nI have put you down for a $SERVICE_CHOSEN_RESULT_FORMATED at $SERVICE_TIME_FORMATED, $CUSTOMER_NAME_FORMATED."


  fi

}

MAIN_MENU "Welcome to My Salon, how can I help you?"

