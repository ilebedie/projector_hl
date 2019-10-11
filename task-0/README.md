# Slowloris attack

In this attack implementation python web server behind the
**NGINX** is under attack.
Generally **NGINX** is not susceptible to slowloris attack as 
it uses event-driven asynchronous architecture instead threaded
architecture.

However the default config makes **NGINX** vulnerable(e.g. uses too 
few worker connections)

## Run test


**Prerequisites**: docker-compose


To run test execute following script: 

`./run.sh`

It will run attacking containers and first run container for
web server with default settings and then web server with 
increased number of worker connections.
It will also query default page, time the connection and 
show the response of the servers

