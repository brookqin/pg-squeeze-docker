ARG PG_VERSION=15
FROM postgres:${PG_VERSION}-alpine

ARG PG_SQUEEZE_VERSION=REL1_6_2
RUN apk add --no-cache --virtual .build-deps \
	llvm15-dev clang15 \
	g++ gcc make \
	git && \
	mkdir /build && cd /build && \
	git clone -b ${PG_SQUEEZE_VERSION} https://github.com/cybertec-postgresql/pg_squeeze.git && \
	cd pg_squeeze && \
	make && \
	make install && \
	cd ../.. && \
	apk del .build-deps && \
	rm -rf /build && \
	sed -i "s/^#\(wal_level\s=\s\)\w\+/\1logical/" /usr/local/share/postgresql/postgresql.conf.sample && \
	sed -i "s/^#\(max_replication_slots\s=\s\)[0-9]\+/\11/" /usr/local/share/postgresql/postgresql.conf.sample && \
	sed -i "s/^#\(shared_preload_libraries\s=\s\)''/\1'pg_squeeze'/" /usr/local/share/postgresql/postgresql.conf.sample
