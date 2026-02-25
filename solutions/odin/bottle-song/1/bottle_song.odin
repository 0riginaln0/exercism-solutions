package bottle_song

import "core:fmt"
import "core:strings"

number_word :: proc(n: int, capitalize: bool) -> (word: string) {
	switch capitalize {
	case true:
		switch n {
		case 0:  word = "no"
		case 1:  word = "One"
		case 2:  word = "Two"
		case 3:  word = "Three"
		case 4:  word = "Four"
		case 5:  word = "Five"
		case 6:  word = "Six"
		case 7:  word = "Seven"
		case 8:  word = "Eight"
		case 9:  word = "Nine"
		case 10: word = "Ten"
		}
	case false:
		switch n {
		case 0:  word = "no"
		case 1:  word = "one"
		case 2:  word = "two"
		case 3:  word = "three"
		case 4:  word = "four"
		case 5:  word = "five"
		case 6:  word = "six"
		case 7:  word = "seven"
		case 8:  word = "eight"
		case 9:  word = "nine"
		case 10: word = "ten"
		}
	}
	return
}

bottle_word :: proc(n: int) -> string {
	return n == 1 ? "bottle" : "bottles"
}

recite :: proc(start_bottles, take_down: int) -> []string {
	lines_per_verse :: 4
	empty_lines := take_down - 1
	total_lines := take_down * lines_per_verse + empty_lines

	result := make([dynamic]string, 0, total_lines)

	for i := 0; i < take_down; i += 1 {
		current        := start_bottles - i
		current_word   := number_word(current, true)
		current_bottle := current == 1 ? "bottle" : "bottles"
		next        := current - 1
		next_word   := number_word(next, false)
		next_bottle := next == 1 ? "bottle" : "bottles"

		append(&result, fmt.aprintf("%s green %s hanging on the wall,", current_word, current_bottle))
		append(&result, fmt.aprintf("%s green %s hanging on the wall,", current_word, current_bottle))
		append(&result, strings.clone("And if one green bottle should accidentally fall,"))
		append(&result, fmt.aprintf("There'll be %s green %s hanging on the wall.", next_word, next_bottle))

		if i < take_down - 1 do append(&result, "")
	}

	return result[:]
}
