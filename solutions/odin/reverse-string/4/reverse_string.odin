package reverse_string

import "core:strings"
import "core:unicode/utf8"

reverse :: proc(str: string) -> string {
	graphemes, grapheme_count, _, _ := utf8.decode_grapheme_clusters(str)
	defer delete(graphemes)

	sb := strings.builder_make()
	#reverse for current_grapheme, i in graphemes {
		data: string

		if i < grapheme_count - 1 {
			// Current grapheme is not the last
			next_grapheme := graphemes[i + 1]
			cluster_width := next_grapheme.byte_index - current_grapheme.byte_index
			data = str[current_grapheme.byte_index:current_grapheme.byte_index + cluster_width]
		} else {
			// Current grapheme is the last
			data = str[current_grapheme.byte_index:]
		}

		strings.write_string(&sb, data)
	}

	return strings.to_string(sb)
}
