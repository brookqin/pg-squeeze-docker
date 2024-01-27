# pg-squeeze-docker

PostgreSQL docker image with pg_squeeze extension based on postgres:{X}-alpine image.
## test


```bash
docker compose up
```

```sql
CREATE EXTENSION pg_squeeze;
```

https://github.com/cybertec-postgresql/pg_squeeze/blob/REL1_6_2/README.md