SQLITE3 =	sqlite3
SQLPORTS =	/usr/local/share/sqlports

.PHONY: all clean

all: gempkg.sqlite

gempkg.sqlite: ${SQSLPORTS} gen.sql
	cp ${SQLPORTS} gempkg.sqlite
	${SQLITE3} gempkg.sqlite < gen.sql

clean:
	rm -f gempkg.sqlite
