package reverse_string

import "core:fmt"
import "core:slice"
import "core:strings"
import "core:unicode/utf8"

reverse :: proc(str: string) -> string {
	sb: strings.Builder
	#reverse for cp in str {
		strings.write_rune(&sb, cp)
		// fmt.println(cp)
	}
	return strings.to_string(sb)
	// sb: strings.Builder
	// graphemes_num, runes, width := utf8.grapheme_count(str)
	// fmt.println("graphemes_num: ", graphemes_num, "runes:", runes, "width:", width)
	// fmt.println(utf8.decode_grapheme_clusters(str, true))

	// runss := utf8.string_to_runes(str)
	// fmt.println(runss)

	// sb: strings.Builder
	// iterator := utf8.decode_grapheme_iterator_make(str)
	// graphemes := make([dynamic]string)
	// defer delete(graphemes)
	// for text, grapheme in utf8.decode_grapheme_iterate(&iterator) {
	// 	// fmt.println(text, grapheme, iterator.last_rune_breaks_forward)
	// 	append_elem(&graphemes, text)
	// }
	// #reverse for grapheme in graphemes {
	// 	strings.write_string(&sb, grapheme)
	// }
	// return strings.to_string(sb)
}
