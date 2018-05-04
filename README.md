# aidb
asset inventory database

## Docker

> sudo docker run -it --name aidb1 -p 5432:5432 -e POSTGRES_PASSWORD=post123 -d peterducai/aidb:latest

then run 

```bash
PGPASSWORD=post123 psql -h localhost -d aidb -U docker -c 'SELECT * FROM aidb.country;'
```
