package high_scores

import "core:slice"

High_Scores :: []int

new_scores :: proc(initial_values: []int) -> High_Scores {
	return slice.clone(initial_values)
}

destroy_scores :: proc(high_scores: ^High_Scores) {
	delete(high_scores^)
}

scores :: proc(high_scores: High_Scores) -> []int {
	return slice.clone(high_scores)
}

latest :: proc(high_scores: High_Scores) -> int {
	return slice.last(high_scores)
}

personal_best :: proc(high_scores: High_Scores) -> int {
	return slice.max(high_scores)
}

personal_top_three :: proc(high_scores: High_Scores) -> []int {
	scores := scores(high_scores)
	defer delete(scores)
	slice.reverse_sort(scores)

	top_three: [dynamic]int
	for i := 0; i < 3 && i < len(scores); i += 1 {
		append(&top_three, scores[i])
	}
	return top_three[:]
}
