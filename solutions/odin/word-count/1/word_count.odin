package word_count

import "core:strings"
import "core:text/regex"
import "core:fmt"

count_word :: proc(input: string) -> map[string]u32 {
	frequencies := make(map[string]u32)

	lc := strings.to_lower(input)
	it, err := regex.create_iterator(lc, `\b[a-z0-9']+\b`)
	if err != nil do return nil
	defer regex.destroy_iterator(it)

	for capture in regex.match_iterator(&it) {
		fmt.println(capture)
		word := capture.groups[0]
		if word in frequencies {
			frequencies[word] += 1
		} else {
			frequencies[word] = 1
		}
	}

	return frequencies
}

main :: proc() {
	fmt.println(count_word("can, can't, 'can't'"))
}
