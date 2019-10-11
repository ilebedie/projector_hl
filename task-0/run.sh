#! /bin/bash
function query_server() {
  for (( i = 0; i < 10; i++ )); do
    echo "Sleep for 2 seconds..."
    sleep 2
    echo "Quering the main page"
    curl -I localhost
    echo "Timing the response"
    curl -s -w 'Testing Website Response Time for :%{url_effective}\n\nLookup Time:\t\t%{time_namelookup}\nConnect Time:\t\t%{time_connect}\nAppCon Time:\t\t%{time_appconnect}\nRedirect Time:\t\t%{time_redirect}\nPre-transfer Time:\t%{time_pretransfer}\nStart-transfer Time:\t%{time_starttransfer}\n\nTotal Time:\t\t%{time_total}\n' http://localhost
  done
}

echo "Attacking vulnerable server..."
docker-compose up -d --scale slowloris=20 appserver vulnerable_nginx slowloris
query_server
docker-compose down

echo "Attacking somewhat protected server..."
docker-compose up -d --scale slowloris=20 appserver protected_nginx slowloris
query_server
docker-compose down

echo "Now there is at least some response!"