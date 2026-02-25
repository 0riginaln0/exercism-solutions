package high_scores

import "core:slice"

High_Scores :: struct {
	values: []int,
}

new_scores :: proc(initial_values: []int) -> High_Scores {
	return High_Scores{values = slice.clone(initial_values)}
}

destroy_scores :: proc(s: ^High_Scores) {
	delete(s.values)
}

scores :: proc(s: High_Scores) -> []int {
	return slice.clone(s.values)
}

latest :: proc(s: High_Scores) -> int {
	return slice.last(s.values)
}

personal_best :: proc(s: High_Scores) -> int {
	return slice.max(s.values)
}

personal_top_three :: proc(s: High_Scores) -> []int {
	local_values := slice.clone(s.values)
	defer delete(local_values)
	slice.reverse_sort(local_values)
	top_3: [dynamic]int
	times := 0
	for value in local_values {
		times += 1
		append(&top_3, value)
		if times == 3 do break
	}
	return top_3[:]
}
