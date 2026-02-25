package reverse_string

import "core:strings"
import "core:unicode/utf8"

reverse :: proc(str: string) -> string {
	graphemes, _, _, _ := utf8.decode_grapheme_clusters(str)
	defer delete(graphemes)
	sb := strings.builder_make()
	#reverse for current_grapheme, i in graphemes {
		data: string
		if i < len(graphemes) - 1 {
			next_grapheme := graphemes[i + 1]
			width := next_grapheme.byte_index - current_grapheme.byte_index
			data = str[current_grapheme.byte_index:current_grapheme.byte_index + width]
		} else {
			data = str[current_grapheme.byte_index:]
		}
		strings.write_string(&sb, data)
	}
	return strings.to_string(sb)
}
