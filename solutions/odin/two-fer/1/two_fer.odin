package two_fer

import "core:fmt"

two_fer :: proc(name: string = "you") -> string {
	return fmt.aprintf("One for %s, one for me.", name)
}
