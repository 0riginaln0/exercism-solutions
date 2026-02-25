package isogram

import "core:fmt"
import "core:sort"
import "core:strings"

Set :: map[rune]bool

new_set :: proc(elements: ..rune) -> (s: Set) {
    add(&s, ..elements)
    return
}

destroy_set :: proc(s: ^Set) {
    delete_map(s^)
}

add :: proc(s: ^Set, elements: ..rune) {
    for elem in elements do s[elem] = true
}

is_isogram :: proc(word: string) -> bool {
    new_set := new_set()
    defer destroy_set(&new_set)

    lowercased_word := strings.to_lower(word)
    defer delete(lowercased_word)

    ignored_runes := 0
    for r in lowercased_word {
        if r == ' ' || r == '-' {
            ignored_runes += 1
            continue
        }
        add(&new_set, r)
    }

    return len(new_set) == (len(word) - ignored_runes)
}
