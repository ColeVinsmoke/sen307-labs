Microsoft Windows [Version 10.0.26300.9457]
(c) Microsoft Corporation. All rights reserved.

C:\Users\cyril>mysql -u root -p
'mysql' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\cyril>cd C:\Program Files\MySQL\MySQL
The system cannot find the path specified.

C:\Users\cyril>cd C:\Program Files\MySQL\MySQL Server 26.7\bin

C:\Program Files\MySQL\MySQL Server 26.7\bin>mysql -u root -p
Enter password: ***************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Cyril;
Query OK, 1 row affected (0.649 sec)

mysql> DROP DATABASE Cyril;
ERROR 1008 (HY000): Can't drop database 'cyril'; database doesn't exist
mysql> DROP DATABASE cyril;
ERROR 1008 (HY000): Can't drop database 'cyril'; database doesn't exist
mysql> CREATE DATABASE sen307_11288;
Query OK, 1 row affected (1.746 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sen307_11288       |
| sys                |
+--------------------+
5 rows in set (0.018 sec)

mysql> USE sen307_11288;
Database changed
mysql> SELECT DATABASE();
+--------------+
| DATABASE()   |
+--------------+
| sen307_11288 |
+--------------+
1 row in set (0.010 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sen307_11288       |
| sys                |
+--------------------+
5 rows in set (0.012 sec)

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 26.7.0    |
+-----------+
1 row in set (0.007 sec)

mysql> SELECT CURRENT_USER();
+----------------+
| CURRENT_USER() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.007 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-10-19 15:06:35 |
+---------------------+
1 row in set (0.008 sec)

mysql> STATUS;
--------------
mysql  Ver 26.7.0 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          11
Current database:       sen307_11288
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_128_GCM_SHA256
Using delimiter:        ;
Server version:         26.7.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 22 min 30 sec

Threads: 4  Questions: 47  Slow queries: 0  Opens: 177  Flush tables: 3  Open tables: 93  Queries per second avg: 0.034
--------------

mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.049 sec)

mysql> SHOW TABLES;
Empty set (0.020 sec)

mysql>
