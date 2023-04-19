#!/usr/bin/env bash

PORT=5000
echo "Port: $PORT"

# POST method predict
curl -d '["The movie was great!"]'\
     -H "Content-Type: application/json" \
     -X POST http://localhost:$PORT/predict


#Should respond like:
#{
#  "positive": false
#}