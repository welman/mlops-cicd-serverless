#!/usr/bin/env bash

PORT=8080
echo "Port: $PORT"

# POST method predict
curl -d '["The movie was great!"]'\
     -H "Content-Type: application/json" \
     -X POST http://localhost:$PORT/predict


# curl http://localhost:8080/health

#Should respond like:
#{
#  "positive": false
#}