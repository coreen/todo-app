#!/bin/bash

show_usage () {
  echo "Usage:"
  echo -e "\t todo list"
  echo -e "\t\t show all todo records"
  echo -e "\t todo add <record>"
  echo -e "\t\t adds record to todo list"
  echo -e "\t\t Note: put quotes around record string"
  echo -e "\t todo delete <recordId>"
  echo -e "\t\t removes record associated with given recordId"
}

LIST=()

list_records () {
  list_length=${#LIST[@]}
  for ((i=0; i<$list_length; i++));
  do
    # indexes don't update after deletion,
    # so only display if have content in index
    # Bash string comparison:
    #  -z => string is null (zero length)
    #  -n => string is not null
    if [ -n "${LIST[$i]}" ]; then
      echo "$i  ${LIST[$i]}"
    fi
  done
}

# takes in content as parameter
add_record () {
  # grab entire parameter
  content=$@
  LIST+=("${content}")
  echo "Added $content"
}

# takes in index as parameter
delete_record () {
  index=$@
  delete=("${LIST[$index]}")
  echo "Deleting $delete"
  LIST=("${LIST[@]/$delete}")
}


show_usage
while true;
do
  read -p "Enter command: " string

  # parse string for command and args (if necessary)
  stringarray=($string)
  command="${stringarray[@]:1:1}"
  args=${stringarray[@]:2}

  if [[ -n $command && $command == "list" ]]; then
    list_records
  elif [[ -n $command && $command == "add" ]]; then
    add_record $args
  elif [[ -n $command && $command == "delete" ]]; then
    delete_record $args
  else
    echo "Error: please see usage for supported commands"
    show_usage
  fi

  # whitespace for console output space
  echo ""
done
