-- name: GetUser :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY id LIMIT $1 OFFSET $2;

-- name: CreateUser :execresult
INSERT INTO users (
  wallet_address,
  name,
  avatar_url
) VALUES (
  $1,
  $2,
  $3
);

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;