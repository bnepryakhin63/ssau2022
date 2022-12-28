## Big Data L4 - ZooKeeper

### ЗАДАНИЕ
Запустить ZooKeeper<p>
Изучить директорию с установкой ZooKeeper<p>
Запустить интерактивную сессию ZooKeeper CLI и освоить её команды<p>
Научиться проводить мониторинг ZooKeeper,<p>
Разработать приложение с барьерной синхронизацией, основанной на ZooKeeper,<p>
Запустить и проверить работу приложения.<p>
### Описание

Знакоство с ZooKeeper выполнено в файле [Знакомство с Zoo.ipynb](https://github.com/bnepryakhin63/ssau2022/blob/main/Big_Data/Lab4/Знакомство%20с%20Zoo.ipynb) через jupyter.<p>
Знакоство с распределёнными приложениями выполнено в файле [Голосования.ipynb](https://github.com/bnepryakhin63/ssau2022/blob/main/Big_Data/Lab4/Голосования.ipynb) через jupyter.<p>
Знакоство с логированием выполнено в файле [Философы.ipynb.ipynb](https://github.com/bnepryakhin63/ssau2022/blob/main/Big_Data/Lab4/Философы.ipynb) через jupyter.<p>

Логи предварительного запуска:
#./bin/zkCli.sh -server localhost:2181<p>
Connecting to localhost:2181<p>
2022-12-27 11:55:12,220 [myid:] - INFO  [main:Environment@100] - Client environment:zookeeper.version=3.4.14-4c25d480e66aadd371de8bd2fd8da255ac140bcf, built on 03/06/2019 16:18 GMT<p>
2022-12-27 11:55:12,226 [myid:] - INFO  [main:Environment@100] - Client environment:host.name=123ae2bd5736<p>
2022-12-27 11:55:12,226 [myid:] - INFO  [main:Environment@100] - Client environment:java.version=1.8.0_292<p>
2022-12-27 11:55:12,230 [myid:] - INFO  [main:Environment@100] - Client environment:java.vendor=Oracle Corporation<p>
2022-12-27 11:55:12,230 [myid:] - INFO  [main:Environment@100] - Client environment:java.home=/usr/local/openjdk-8<p>
2022-12-27 11:55:12,231 [myid:] - INFO  [main:Environment@100] - Client environment:java.class.path=/zookeeper-3.4.14/bin/../zookeeper-server/target/classes:/zookeeper-3.4.14/bin/../build/classes:/zookeeper-3.4.14/bin/../zookeeper-server/target/lib/*.jar:/zookeeper-3.4.14/bin/../build/lib/*.jar:/zookeeper-3.4.14/bin/../lib/slf4j-log4j12-1.7.25.jar:/zookeeper-3.4.14/bin/../lib/slf4j-api-1.7.25.jar:/zookeeper-3.4.14/bin/../lib/netty-3.10.6.Final.jar:/zookeeper-3.4.14/bin/../lib/log4j-1.2.17.jar:/zookeeper-3.4.14/bin/../lib/jline-0.9.94.jar:/zookeeper-3.4.14/bin/../lib/audience-annotations-0.5.0.jar:/zookeeper-3.4.14/bin/../zookeeper-3.4.14.jar:/zookeeper-3.4.14/bin/../zookeeper-server/src/main/resources/lib/*.jar:/conf:<p>
2022-12-27 11:55:12,231 [myid:] - INFO  [main:Environment@100] - Client environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib<p>
2022-12-27 11:55:12,231 [myid:] - INFO  [main:Environment@100] - Client environment:java.io.tmpdir=/tmp<p>
2022-12-27 11:55:12,231 [myid:] - INFO  [main:Environment@100] - Client environment:java.compiler=<NA><p>
2022-12-27 11:55:12,231 [myid:] - INFO  [main:Environment@100] - Client environment:os.name=Linux<p>
2022-12-27 11:55:12,232 [myid:] - INFO  [main:Environment@100] - Client environment:os.arch=amd64<p>
2022-12-27 11:55:12,232 [myid:] - INFO  [main:Environment@100] - Client environment:os.version=5.10.16.3-microsoft-standard-WSL2<p>
2022-12-27 11:55:12,232 [myid:] - INFO  [main:Environment@100] - Client environment:user.name=root<p>
2022-12-27 11:55:12,232 [myid:] - INFO  [main:Environment@100] - Client environment:user.home=/root<p>
2022-12-27 11:55:12,232 [myid:] - INFO  [main:Environment@100] - Client environment:user.dir=/zookeeper-3.4.14<p>
2022-12-27 11:55:12,234 [myid:] - INFO  [main:ZooKeeper@442] - Initiating client connection, connectString=localhost:2181 sessionTimeout=30000 watcher=org.apache.zookeeper.ZooKeeperMain$MyWatcher@5ce65a89
Welcome to ZooKeeper!<p>
2022-12-27 11:55:12,281 [myid:] - INFO  [main-SendThread(localhost:2181):ClientCnxn$SendThread@1025] - Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)<p>
JLine support is enabled<p>
2022-12-27 11:55:12,409 [myid:] - INFO  [main-SendThread(localhost:2181):ClientCnxn$SendThread@879] - Socket connection established to localhost/127.0.0.1:2181, initiating session<p>
2022-12-27 11:55:12,457 [myid:] - INFO  [main-SendThread(localhost:2181):ClientCnxn$SendThread@1299] - Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x10001763b860002, negotiated timeout = 3000<p>



