package leap

is_leap_year :: proc(year: int) -> bool {
	if divisible_by(year, 400) do return true
	if divisible_by(year, 100) do return false
	if divisible_by(year, 4)   do return true
	return false
}

divisible_by :: proc(num, div: int) -> bool {
	return num % div == 0
}