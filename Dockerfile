FROM mongo

COPY /backup/kpi.gz  /tmp/kpi.gz

CMD mongod --fork --logpath /var/log/mongodb.log; \
    mongorestore  -v --gzip --archive=/tmp/kpi.gz  --objcheck; \
    mongod --shutdown; \
    docker-entrypoint.sh mongod
