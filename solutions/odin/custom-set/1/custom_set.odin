package custom_set

import "core:sort"
import "core:strings"

Set :: map[int]bool

new_set :: proc(elements: ..int) -> (s: Set) {
    for elem in elements do add(&s, elem)
    return
}

destroy_set :: proc(s: ^Set) {
    delete_map(s^)
}

to_string :: proc(s: Set) -> string {
    values := make_dynamic_array([dynamic]int)
    defer delete(values)
    for k in s do append_elem(&values, k)
    sort.bubble_sort(values[:])
    sb := strings.builder_make()
    strings.write_string(&sb, "[")
    set_size := len(s); c := 1
    for v in values {
        strings.write_int(&sb, v)
        if c != set_size do strings.write_string(&sb, ", ")
        c += 1
    }
    strings.write_string(&sb, "]")
    return strings.to_string(sb)
}

is_empty :: proc(s: Set) -> bool {
    return len(s) == 0
}

contains :: proc(s: Set, element: int) -> bool {
    return element in s
}

is_subset :: proc(s: Set, other: Set) -> bool {
    for v in s {
        if v in other do continue
        return false
    }
    return true
}

is_disjoint :: proc(s: Set, other: Set) -> bool {
    for v in s {
        if v not_in other do continue
        return false
    }
    return true
}

equal :: proc(s: Set, other: Set) -> bool {
    return is_subset(s, other) && is_subset(other, s)
}

add :: proc(s: ^Set, elements: ..int) {
    for elem in elements do s[elem] = true
}

intersection :: proc(s: Set, other: Set) -> (set: Set) {
    for k in s do if k in other do set[k] = true
    for k in other do if k in s do set[k] = true
    return
}

difference :: proc(s: Set, other: Set) -> (set: Set) {
    for k in s do if k not_in other do set[k] = true
    return
}

join :: proc(s: Set, other: Set) -> (set: Set) {
    for k in s do set[k] = true
    for k in other do set[k] = true
    return
}
