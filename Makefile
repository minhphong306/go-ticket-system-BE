postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root ticketnft

dropdb:
	docker exec -it postgres12 dropdb ticketnft

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/ticketnft?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/ticketnft?sslmode=disable" -verbose down

migrateforce:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/ticketnft?sslmode=disable" force 1

test:
	go test -v -cover ./...

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb mgirateup migratedown sqlc test migrateforce	