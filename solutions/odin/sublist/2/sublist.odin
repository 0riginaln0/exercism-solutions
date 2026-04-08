package sublist

Comparison :: enum {
	Equal,
	Sublist,
	Superlist,
	Unequal,
}

are_slices_equal :: proc(lhs: []$T, rhs: []T) -> bool {
	if len(lhs) != len(rhs) do return false
	for el, i in lhs do if el != rhs[i] do return false
	return true
}

starts_with :: proc(list: []$T, prefix: []T) -> bool {
	if len(prefix) > len(list) do return false
	for el, i in prefix do if el != list[i] do return false
	return true
}

is_sublist :: proc(needle: []$T, haystack: []T) -> bool {
	if len(haystack) == 0 do return false
	if starts_with(haystack, needle) do return true
	return is_sublist(needle, haystack[1:])
}

compare :: proc(list_a: []$T, list_b: []T) -> Comparison {
	if are_slices_equal(list_a, list_b) do return .Equal
	if len(list_a) < len(list_b) && is_sublist(list_a, list_b) do return .Sublist
	if len(list_b) < len(list_a) && is_sublist(list_b, list_a) do return .Superlist
	return .Unequal
}	
