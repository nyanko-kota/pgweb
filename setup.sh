#!/bin/sh
	
	for i in `seq 1 120`; do
	  echo "Wait for 1 seconds..."
	  sleep 1
	
	  export PGPASSWORD=password

	  /usr/bin/psql -h 'postgres' -p '5432' -U 'root' -c 'select 1;' 2>&1 > /dev/null

	  if [[ $? -eq 0 ]]; then
	    echo "Connection established."
	    exit 0
	  fi
	done
	
	echo "Failed to connect to database."
	exit 1
