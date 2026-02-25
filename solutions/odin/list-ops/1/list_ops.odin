package list_ops

import "core:slice"
ls_append :: proc(l: []$T, other: []T) -> []T {
    appended: [dynamic]T
    append(&appended, ..l)
    append(&appended, ..other)
    return appended[:]
}

ls_concat :: proc(lists: [][]$T) -> []T {
    concatenated: [dynamic]T
    for list in lists do append(&concatenated, ..list)
    return concatenated[:]
}

ls_filter :: proc(l: []$T, pred: proc(element: T) -> bool) -> []T {
    filtered: [dynamic]T
    for elem in l do if pred(elem) do append(&filtered, elem)
    return filtered[:]
}

ls_length :: proc(l: []$T) -> int {
    return len(l)
}

ls_map :: proc(l: []$T, transform: proc(element: T) -> $U) -> []U {
    transformed: [dynamic]T
    for elem in l do append(&transformed, transform(elem))
    return transformed[:]
}

ls_foldl :: proc(l: []$T, initial_value: T, fn: proc(acc, element: T) -> $U) -> U {
    zero: U = initial_value
    for elem in l do zero = fn(zero, elem)
    return zero
}

ls_foldr :: proc(l: []$T, initial_value: T, fn: proc(acc, element: T) -> $U) -> U {
    zero: U = initial_value
    #reverse for elem in l do zero = fn(zero, elem)
    return zero
}

ls_reverse :: proc(l: []$T) -> []T {
    reversed: [dynamic]T
    #reverse for elem in l do append(&reversed, elem)
    return reversed[:]
}
