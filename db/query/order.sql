-- name: CreateOrder :one
INSERT INTO orders (customer_id, total)
VALUES ($1, $2)
RETURNING *;

-- name: GetOrder :one
SELECT * FROM orders WHERE id = $1;

-- name: UpdateOrder :exec
UPDATE orders
SET customer_id = $2, total = $3
WHERE id = $1;

-- name: DeleteOrder :exec
DELETE FROM orders WHERE id = $1;

-- name: ListOrders :many
SELECT * FROM orders;