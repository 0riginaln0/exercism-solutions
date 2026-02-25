package allergies

Allergen :: enum {
	Eggs         = 1 << 0,
	Peanuts      = 1 << 1,
	Shellfish    = 1 << 2,
	Strawberries = 1 << 3,
	Tomatoes     = 1 << 4,
	Chocolate    = 1 << 5,
	Pollen       = 1 << 6,
	Cats         = 1 << 7,
}

allergic_to :: proc(score: int, allergen: Allergen) -> bool {
	return Allergen(score) & allergen == allergen
}

list :: proc(score: int) -> []Allergen {
    allergens := make_dynamic_array([dynamic]Allergen)
	for allergen in Allergen {
		if allergic_to(score, allergen) do append(&allergens, allergen)
	}
	return allergens[:]
}
