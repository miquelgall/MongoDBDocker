docker network create mongo-network;
docker run --name mongodb --network mongo-network  -p 27017:27017 -d mongo;
docker cp kpi.gz mongodb:/tmp;
docker exec mongodb mongorestore -v --gzip --archive=/tmp/kpi.gz  --objcheck;
