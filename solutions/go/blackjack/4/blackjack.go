package blackjack

func ParseCard(card string) int {
	switch card {
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten", "jack", "queen", "king":
		return 10
	case "ace":
		return 11
	default:
		return 0
	}
}

func FirstTurn(card1, card2, dealerCard string) string {
	switch cards, dealer := ParseCard(card1)+ParseCard(card2), ParseCard(dealerCard); {
	case cards == 22:
		return "P"
	case cards == 21 && dealer < 10:
		return "W"
	case cards >= 17 || cards >= 12 && dealer < 7:
		return "S"
	default:
		return "H"
	}
}
