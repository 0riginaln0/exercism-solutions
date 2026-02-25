package pythagorean_triplet

Triplet :: struct {
	a, b, c: int,
}

triplets_with_sum :: proc(n: int) -> []Triplet {
	triplets: [dynamic]Triplet
	for a in 1..<(n - 2) do for b in (a + 1)..<(n - 1) {
		c := n - a - b
		if a * a + b * b == c * c {
			append(&triplets, Triplet{a, b, c})
		}
	}
	return triplets[:]
}
