-- name: CreateOrderDetail :one
INSERT INTO order_detail (order_id, ticket_id, price, qty, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING *;

-- name: GetOrderDetail :one
SELECT * FROM order_detail WHERE id = $1;

-- name: UpdateOrderDetail :exec
UPDATE order_detail
SET order_id = $2, ticket_id = $3, price = $4, qty = $5, updated_at = $6
WHERE id = $1;

-- name: DeleteOrderDetail :exec
DELETE FROM order_detail WHERE id = $1;

-- name: ListOrderDetails :many
SELECT * FROM order_detail;