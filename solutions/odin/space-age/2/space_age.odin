package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> (age: f64) {
	earth_years := f64(seconds) / 31_557_600
	switch planet {
	case .Mercury: age = earth_years / 0.2408467
	case .Venus:   age = earth_years / 0.61519726
	case .Earth:   age = earth_years / 1
	case .Mars:    age = earth_years / 1.8808158
	case .Jupiter: age = earth_years / 11.862615
	case .Saturn:  age = earth_years / 29.447498
	case .Uranus:  age = earth_years / 84.016846
	case .Neptune: age = earth_years / 164.79132
	}
	return
}