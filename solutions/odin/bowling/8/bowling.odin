package bowling

import "core:math"

Game :: struct {
	frames:  [dynamic]int,
	current: [dynamic]int,
	pins:    int,
}

Error :: enum {
	None,
	Game_Over,
	Game_Not_Over,
	Roll_Not_Between_1_And_10,
	Rolls_in_Frame_Exceed_10_Points,
}

new_game :: proc() -> (g: Game) {
	g.frames = make([dynamic]int)
	g.current = make([dynamic]int)
	reset_pins(&g)
	return g
}

destroy_game :: proc(g: ^Game) {
	delete(g.frames)
	delete(g.current)
}

roll :: proc(g: ^Game, pins: int) -> Error {
	if done(g^)              do return .Game_Over
	if pins < 0 || pins > 10 do return .Roll_Not_Between_1_And_10
	if pins > g.pins         do return .Rolls_in_Frame_Exceed_10_Points

	append_elem(&g.current, pins)
	g.pins -= pins
	if g.pins == 0 do reset_pins(g)

	if len(g.current) == 3 && strike(g^) {
		append_elem(&g.frames, math.sum(g.current[:]))
		new_current := make([dynamic]int, len(g.current) - 1)
		copy(new_current[:], g.current[1:])
		delete(g.current); g.current = new_current
	}

	if len(g.current) == 3 && spare(g^) {
		append_elem(&g.frames, math.sum(g.current[:]))
		new_current := make([dynamic]int, len(g.current) - 2)
		copy(new_current[:], g.current[2:])
		delete(g.current); g.current = new_current
	}

	if !done(g^) && open(g^) && len(g.current) == 2 {
		append_elem(&g.frames, math.sum(g.current[:]))
		delete(g.current); g.current = make([dynamic]int)
		reset_pins(g)
	}
	
	return .None
}

score :: proc(g: Game) -> (int, Error) {
	if !done(g) do return 0, .Game_Not_Over
	return math.sum(g.frames[:]), .None
}

done :: proc(g: Game) -> bool {
	return len(g.frames) == 10
}

reset_pins :: proc(g: ^Game) {
	g.pins = 10
}

strike :: proc(g: Game) -> bool {
	if len(g.current) < 1 do return false
	return g.current[0] == 10
}

spare :: proc(g: Game) -> bool {
	if len(g.current) < 2 do return false
	return math.sum(g.current[:2]) == 10
}

open :: proc(g: Game) -> bool {
	return !spare(g) && !strike(g)
}
