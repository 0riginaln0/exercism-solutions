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
	orbital_period_in_earth_years_on := [Planet]f64 {
		.Mercury = 0.2408467, .Venus   = 0.61519726,
		.Earth   = 1,         .Mars    = 1.8808158,
		.Jupiter = 11.862615, .Saturn  = 29.447498,
		.Uranus  = 84.016846, .Neptune = 164.79132,
	}
	return earth_years / orbital_period_in_earth_years_on[planet]
}
