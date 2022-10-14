# Rails Cloud Spanner

This project uses [Google Cloud Spanner](https://cloud.google.com/spanner) for Database in Ruby on Rails.

# Usage
## Run the application
```
$ docker-compose build
$ docker-compose up

# create tables
$ docker-compose run --rm app bundle exec rails db:migrate
or
$ docker-compose exec app bash
$ root:/app# bin/rails db:migrate
```

### Optional
```
$ docker-compose run --rm app bundle exec rails db:seed
```
or
```
$ docker-compose exec app bash
$ root:/app# bin/rails db:seed
```

## Open Swagger
API is defined to CRUD the Users table.
```
$ open http://localhost:8080
```

## Connect to Spanner
```
$ docker-compose exec spanner-cli spanner-cli -p rails-cloud-spanner-project -i rails-cloud-spanner-instance -d rails-cloud-spanner-dev-db

Connected.

spanner> show databases;
+-----------------------------+
| Database                    |
+-----------------------------+
| rails-cloud-spanner-dev-db  |
| rails-cloud-spanner-test-db |
+-----------------------------+
1 rows in set (0.00 sec)

spanner> use rails-cloud-spanner-dev-db;

spanner> select * from users;
+---------------------+--------+--------------------------------+--------------------------------+
| id                  | name   | created_at                     | updated_at                     |
+---------------------+--------+--------------------------------+--------------------------------+
| 3170807293203701002 | Taro   | 2022-10-14T01:52:19.366271027Z | 2022-10-14T01:52:19.366271027Z |
| 1015837573998270549 | Ryo    | 2022-10-14T01:52:19.374780322Z | 2022-10-14T01:52:19.374780322Z |
| 4477259727138704899 | Hanako | 2022-10-14T01:52:19.35650571Z  | 2022-10-14T01:52:19.35650571Z  |
+---------------------+--------+--------------------------------+--------------------------------+
3 rows in set (1.795602ms)
```