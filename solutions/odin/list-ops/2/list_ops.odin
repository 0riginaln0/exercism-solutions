package list_ops

import "core:slice"

ls_append :: proc(l: []$T, other: []T) -> []T {
    appended: [dynamic]T
    append(&appended, ..l)
    append(&appended, ..other)
    return appended[:]
}

ls_concat :: proc(lists: [][]$T) -> []T {
    return slice.concatenate(lists)
}

ls_filter :: proc(l: []$T, pred: proc(element: T) -> bool) -> []T {
    return slice.filter(l, pred)
}

ls_length :: proc(l: []$T) -> int {
    return slice.length(l)
}

ls_map :: proc(l: []$T, transform: proc(element: T) -> $U) -> []U {
    return slice.mapper(l, transform)
}

ls_foldl :: proc(l: []$T, initial_value: T, fn: proc(acc, element: T) -> $U) -> U {
    return slice.reduce(l, initial_value, fn)
}

ls_foldr :: proc(l: []$T, initial_value: T, fn: proc(acc, element: T) -> $U) -> U {
    return slice.reduce_reverse(l, initial_value, fn)
}

ls_reverse :: proc(l: []$T) -> []T {
    res := slice.clone(l)
    slice.reverse(res)
    return res
}
