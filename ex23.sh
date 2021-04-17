#!/bin/bash
# Sapir Hender 208414573

# Check the args
if [ "$#" -eq 0 ]; then
    echo "Invalid input"
    exit
fi

# Function that return the value after the "="
parse_file () {
  # First arg
  searched=$1
  delimiter=$2
  fileName=$3

  # Separate by new line
  while IFS= read -r line
  do
    # Separate by the delimiter and take the first value of each line
    key="$(cut -d "$delimiter" -f1 <<< "$line")"
    key=$(echo $key)
    # If the result is not empty, print
    if [ "$key" = "$searched" ]
    then
      # Take the second arg after the '='
      value="$(cut -d "$delimiter" -f2 <<< "$line")"
      # Print without quotes
      echo $value | tr -d \"
    fi
  done < $fileName
}

parse_system() {
  parse_file "$1" "=" "os-release"
}

parse_hostname() {
  parse_file "$1" ":" "hostnamectl"
}

# The argument can be "system" or "host", and this is determines which flags it can accept
firstArg=$1
if [ $firstArg = "system" ]
then
  if [ "$#" -eq 1 ]; then
    cat "os-release"
    exit
  fi

  for arg in "$@"
  do
      case $arg in
          --name)
          parse_system "NAME"
          ;;
          --version)
          parse_system "VERSION"
          ;;
          --pretty_name)
          parse_system "PRETTY_NAME"
          ;;
          --home_url)
          parse_system "HOME_URL"
          ;;
          --support_url)
          parse_system "SUPPORT_URL"
          ;;
      esac
  done
elif [ $firstArg = "host" ]
then
  if [ "$#" -eq 1 ]; then
    cat "hostnamectl"
    exit
  fi

  for arg in "$@"
  do
      case $arg in
          --static_hostname)
          parse_hostname "Static hostname"
          ;;
          --icon_name)
          parse_hostname "Icon name"
          ;;
          --name)
          parse_hostname "Icon name"
          ;;
          --machine_id)
          parse_hostname "Machine ID"
          ;;
          --boot_id)
          parse_hostname "Boot ID"
          ;;
          --virtualization)
          parse_hostname "Virtualization"
          ;;
          --kernel)
          parse_hostname "Kernel"
          ;;
          --architecture)
          parse_hostname "Architecture"
          ;;
      esac
  done
else
  echo "Invalid input"
fi
