-- name: CreateTicket :one
INSERT INTO ticket (event_id, name, amount, price, status, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5, $6, $7)
RETURNING *;

-- name: UpdateTicket :exec
UPDATE ticket
SET event_id = $2, name = $3, amount = $4, price = $5, status = $6, updated_at = $7
WHERE id = $1;

-- name: DeleteTicket :exec
DELETE FROM ticket WHERE id = $1;

-- name: ListTickets :many
SELECT * FROM ticket ORDER BY created_at DESC;

-- name: GetTicket :one
SELECT * FROM ticket WHERE id = $1;