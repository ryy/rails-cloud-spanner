# Rails Cloud Spanner

This project uses [Google Cloud Spanner](https://cloud.google.com/spanner) for Database in Ruby on Rails.

# Installation
Users table is created in CloudSpanner and three data are inserted by default.
```
$ docker-compose build
$ docker-compose up
```

# Usage
## Open Swagger
API is defined to CRUD the Users table.
```
$ open http://localhost:8080
```

## Connect to Spanner
```
$ docker-compose exec spanner-cli spanner-cli -p test-project -i test-instance -d test-database

Connected.

spanner> show databases;
+---------------+
| Database      |
+---------------+
| test-database |
+---------------+
1 rows in set (0.00 sec)

spanner> use test-database;

spanner> select * from Users;
+----+--------+
| Id | Name   |
+----+--------+
| 2  | Hanako |
| 1  | Taro   |
| 3  | Ryo    |
+----+--------+
3 rows in set (1.795602ms)
```