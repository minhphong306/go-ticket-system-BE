-- name: CreateEvent :one
INSERT INTO event (author_id, name, date, location, description, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5, $6, $7)
RETURNING *;

-- name: GetEvent :one
SELECT * FROM event WHERE id = $1;

-- name: UpdateEvent :exec
UPDATE event
SET author_id = $2, name = $3, date = $4, location = $5, description = $6, updated_at = $7
WHERE id = $1;

-- name: DeleteEvent :exec
DELETE FROM event WHERE id = $1;