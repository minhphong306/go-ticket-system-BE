package util

import (
	"math/rand"
)

var letter = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

// RandomInt generates a random integer between min and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// RandomString generates a random string of length n
func RandomString(n int) string {

	b := make([]rune, n)
	for i := range b {
			b[i] = letter[rand.Intn(len(letter))]
	}
	return string(b)
}

func RandomName() string {
	return RandomString(10)
}