package darts

import "core:math"

score :: proc(x, y: f64) -> int {
	distance := math.hypot(x, y)
	switch {
		case distance <=  1: return 10
		case distance <=  5: return  5
		case distance <= 10: return  1
		case:                return  0
	}
}
