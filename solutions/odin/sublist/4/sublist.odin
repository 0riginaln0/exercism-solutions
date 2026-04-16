package sublist

import "core:slice"

Comparison :: enum {
	Equal,
	Sublist,
	Superlist,
	Unequal,
}

compare :: proc(list_a: []$T, list_b: []T) -> Comparison {
	if slice.equal(list_a, list_b) do return .Equal
	if len(list_a) < len(list_b) && is_sublist(list_a, list_b) do return .Sublist
	if len(list_b) < len(list_a) && is_sublist(list_b, list_a) do return .Superlist
	return .Unequal
}

is_sublist :: proc(needle: []$T, haystack: []T) -> bool {
	if len(haystack) == 0 do return false
	if slice.has_prefix(haystack, needle) do return true
	return is_sublist(needle, haystack[1:])
}
