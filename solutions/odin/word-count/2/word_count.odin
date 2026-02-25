package word_count

import "core:strings"
import "core:text/regex"

count_word :: proc(input: string) -> map[string]u32 {
	frequencies := make(map[string]u32)

	lc := strings.to_lower(input)
	defer delete(lc)
	it, _ := regex.create_iterator(lc, `\b[a-z0-9']+\b`)
	defer regex.destroy_iterator(it)

	for capture in regex.match_iterator(&it) {
		word := strings.clone(capture.groups[0])
		if word in frequencies {
			frequencies[word] += 1
			delete(word)
		} else {
			frequencies[word] = 1
		}
	}

	return frequencies
}
