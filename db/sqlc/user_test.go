package db

import (
	"context"
	"testing"

	"github.com/minhphong306/go-ticket-system-BE/util"
	"github.com/stretchr/testify/require"
)

func TestCreateUser(t *testing.T) {
	arg := CreateUserParams{
		WalletAddress: "test123",
		Name:          util.RandomName(),
		AvatarUrl:     "https://google.com",
	}

	account, err := testQueries.CreateUser(context.Background(), arg);
	require.NoError(t, err)
	require.NotEmpty(t, account)
}
