package line_up

import "core:fmt"

ordinal_suffix :: proc(number: int) -> string {
	switch number % 20 {
		case 1: return "st"
		case 2: return "nd"
		case 3: return "rd"
		case:   return "th"
	}
}

format :: proc(name: string, number: int) -> string {
	return fmt.aprintf(
		"%s, you are the %d%s customer we serve today. Thank you!",
		name,
		number,
		ordinal_suffix(number),
	)
}
