# pg-squeeze-docker

PostgreSQL docker image with pg_squeeze extension based on postgres:{X}-alpine image.
## test

create a .env file with the following content:
```
POSTGRES_USER=postgres
POSTGRES_PASSWORD=changePassword
POSTGRES_DB=test
POSTGRES_NON_ROOT_USER=test
POSTGRES_NON_ROOT_PASSWORD=test
```

start the container:
```bash
docker compose up
```

connect to the database with postgres user then:
```sql
CREATE EXTENSION pg_squeeze;
```

https://github.com/cybertec-postgresql/pg_squeeze/blob/REL1_6_2/README.md