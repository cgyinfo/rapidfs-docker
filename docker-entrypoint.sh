#!/bin/bash

new_val=$REDIS_ADDRESS
old_val="localhost"

sed -i "s/$old_val/$new_val/g" /opt/rapidfs/config.js

echo "start rapidfs daemon"
cd /opt/rapidfs
npm run start

tail -f /dev/null