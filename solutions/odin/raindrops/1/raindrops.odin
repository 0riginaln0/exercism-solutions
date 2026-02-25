package raindrops

import "core:fmt"
import "core:strings"

convert :: proc(number: int) -> string {
	sb: strings.Builder
	defer strings.builder_destroy(&sb)
	if number % 3 == 0 do strings.write_string(&sb, "Pling")
	if number % 5 == 0 do strings.write_string(&sb, "Plang")
	if number % 7 == 0 do strings.write_string(&sb, "Plong")
	if len(sb.buf) == 0 do return fmt.aprintf("%d", number)
	return strings.to_string(sb)
}
