package sublist

Comparison :: enum {
	Equal,
	Sublist,
	Superlist,
	Unequal,
}

are_lists_equal :: proc(lhs: []$T, rhs: []T) -> bool {
	if len(lhs) != len(rhs) do return false
	for el, i in lhs do if el != rhs[i] do return false
	return true
}

is_sublist :: proc(needle: []$T, haystack: []T) -> bool {
	if len(needle) == 0 do return true
	if len(needle) > len(haystack) do return false
	for ch, i in needle {
		if ch != haystack[i] do break
		if i == len(needle) - 1 do return true
	}
	return is_sublist(needle, haystack[1:])
}

compare :: proc(list_a: []$T, list_b: []T) -> Comparison {
	if are_lists_equal(list_a, list_b) do return .Equal
	if is_sublist(list_a, list_b) do return .Sublist
	if is_sublist(list_b, list_a) do return .Superlist
	return .Unequal
}	
