package techpalace

import (
	"fmt"
	"strings"
)

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return fmt.Sprintf("Welcome to the Tech Palace, %s", strings.ToUpper(customer))
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	sb := strings.Builder{}
	border := strings.Repeat("*", numStarsPerLine)
	sb.WriteString(border)
	sb.WriteByte('\n')
	sb.WriteString(welcomeMsg)
	sb.WriteByte('\n')
	sb.WriteString(border)
	return sb.String()
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	n1 := strings.ReplaceAll(oldMsg, "*", "")
	n2 := strings.ReplaceAll(n1, "\n", "")
	return strings.Trim(n2, " ")
}
