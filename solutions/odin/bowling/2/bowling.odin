package bowling

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
		append_elem(&g.frames, sum(g.current[:]))

		new_current := make([dynamic]int, len(g.current) - 1)
		copy(new_current[:], g.current[1:])
		delete(g.current)
		g.current = new_current
	}

	if len(g.current) == 3 && spare(g^) {
		append_elem(&g.frames, sum(g.current[:]))

		new_current := make([dynamic]int, len(g.current) - 2)
		copy(new_current[:], g.current[2:])
		delete(g.current)
		g.current = new_current
	}

	if !done(g^) && open(g^) && len(g.current) == 2 {
		append_elem(&g.frames, sum(g.current[:]))

		delete(g.current)
		g.current = make([dynamic]int)
		reset_pins(g)
	}

	return .None
}

score :: proc(b: Game) -> (int, Error) {
	if !done(b) do return 0, .Game_Not_Over
	return sum(b.frames[:]), .None
}


reset_pins :: proc(b: ^Game) {
	b.pins = 10
}

spare :: proc(b: Game) -> bool {
	if len(b.current) < 2 do return false
	return sum(b.current[:2]) == 10
}

strike :: proc(b: Game) -> bool {
	if len(b.current) < 1 do return false
	return b.current[0] == 10
}

open :: proc(b: Game) -> bool {
	return !spare(b) && !strike(b)
}

done :: proc(b: Game) -> bool {
	return len(b.frames) == 10
}

sum :: proc(sl: []int) -> (res: int) {
	for el in sl do res += el
	return
}
