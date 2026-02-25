package pangram

import "core:strings"

is_pangram :: proc(str: string) -> bool {
	lc_str := strings.to_lower(str)
	defer delete(lc_str)
	alphabet := bit_set['a' ..= 'z'] {
		'a','b','c','d','e','f','j','h','i','j','k','l','m',
		'n','o','p','q','r','s','t','u','v','w','x','y','z',
	}
	used := bit_set['a' ..= 'z']{}
	for r in lc_str do if r in alphabet && r not_in used do used += {r}
	return card(alphabet) == card(used)
}
