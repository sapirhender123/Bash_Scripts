#!/bin/bash

# Check the args
if [ "$#" -eq 0 ]; then
    echo "Invalid input"
    exit
fi

name=false
version=false
pretty_name=false
home_url=false
support_url=false
static_hostname=false
icon_name=false
machine_id=false
boot_id=false
virtualization=false
kernel=false
architecture=false

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
  # Ignore from the first arg
  shift
  for arg in "$@"
  do
      case $arg in
          --name)
          if [ "$name" = false ]; then
            parse_system "NAME"
          fi
          name=true
          ;;
          --version)
          if [ "$version" = false ]; then
            parse_system "VERSION"
          fi
          version=true
          ;;
          --pretty_name)
          if [ "$pretty_name" = false ]; then
            parse_system "PRETTY_NAME"
          fi
          pretty_name=true
          ;;
          --home_url)
          if [ "$home_url" = false ]; then
            parse_system "HOME_URL"
          fi
          home_url=true
          ;;
          --support_url)
          if [ "$support_url" = false ]; then
            parse_system "SUPPORT_URL"
          fi
          support_url=true
          ;;
      esac
  done

  if [ "$name" = false ] && \
      [ "$version" = false ] && \
      [ "$pretty_name" = false ] && \
      [ "$home_url" = false ] && \
      [ "$support_url" = false ]
  then
    cat "os-release"
  fi

elif [ $firstArg = "host" ]
then
  if [ "$#" -eq 1 ]; then
    cat "hostnamectl"
    exit
  fi

  # Ignore from the first arg
  shift
  for arg in "$@"
  do
      case $arg in
          --static_hostname)
          if [ "$static_hostname" = false ]; then
            parse_hostname "Static hostname"
          fi
          static_hostname=true
          ;;
          --icon_name)
          if [ "$icon_name" = false ]; then
            parse_hostname "Icon name"
          fi
          icon_name=true
          ;;
          --machine_id)
          if [ "$machine_id" = false ]; then
            parse_hostname "Machine ID"
          fi
          machine_id=true
          ;;
          --boot_id)
          if [ "$boot_id" = false ]; then
            parse_hostname "Boot ID"
          fi
          boot_id=true
          ;;
          --virtualization)
          if [ "$virtualization" = false ]; then
            parse_hostname "Virtualization"
          fi
          virtualization=true
          ;;
          --kernel)
          if [ "$kernel" = false ]; then
            parse_hostname "Kernel"
          fi
          kernel=true
          ;;
          --architecture)
          if [ "$architecture" = false ]; then
            parse_hostname "Architecture"
          fi
          architecture=true
          ;;
      esac
  done
  if [ "$static_hostname" = false ] && \
      [ "$icon_name" = false ] && \
      [ "$machine_id" = false ] && \
      [ "$boot_id" = false ] && \
      [ "$virtualization" = false ] && \
      [ "$kernel" = false ] && \
      [ "$architecture" = false ]
  then
    cat "hostnamectl"
  fi
else
  echo "Invalid input"
fi
