# Create a Docker network
$ docker network create --subnet=192.168.10.0/24 db-cluster

# Start the container
$ docker run -d --name clustercontrol \
--network db-cluster \
--ip 192.168.23.50 \
-h clustercontrol \
-p 5000:80 \
-p 5001:443 \
-p 9443:9443 \
-p 19501:19501 \
-e DOCKER_HOST_ADDRESS=192.168.23.10 \
-v /storage/clustercontrol/cmon.d:/etc/cmon.d \
-v /storage/clustercontrol/datadir:/var/lib/mysql \
-v /storage/clustercontrol/sshkey:/root/.ssh \
-v /storage/clustercontrol/cmonlib:/var/lib/cmon \
-v /storage/clustercontrol/backups:/root/backups \
severalnines/clustercontrol