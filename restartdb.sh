#!/bin/bash
docker-compose down
docker volume rm 102db-management_db-data
docker-compose up