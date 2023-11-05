package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateUser(t *testing.T) {
	arg := CreateUserParams{
		WalletAddress: "test123",
		Name:          "Minh Phong",
		AvatarUrl:     "https://google.com",
	}

	account, err := testQueries.CreateUser(context.Background(), arg);
	require.NoError(t, err)
	require.NotEmpty(t, account)
}
