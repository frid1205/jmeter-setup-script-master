var1=$(docker inspect $(docker ps -a | grep -v "master" | awk 'NR>1 {print $1}'
 ) | grep -Po '"IPAddress":.*?[^\\]?[^\\]",' |awk '{print $2}'| sort -u | tr -d '"'| tr -d '\n')


docker exec -it master /bin/bash -c "rm -rf $1 $2"

docker cp /home/fendy_ridwan/$1 master:$1

docker exec -it master /bin/bash -c "rm -rf $1 $2"

docker cp /home/fendy_ridwan master:$1

docker cp /home/fendy_ridwan/latihan.jmx master:/HTTPReq.jmx

docker exec -it master /bin/bash -c "jmeter -n -t /HTTPReq.jmx -R${var1::-1} -l /testresult.jtl"
