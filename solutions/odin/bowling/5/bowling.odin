package bowling

Game :: struct {
	frame:      int,
	standing:   int,
	ball:       int,
	bonus:      [2]int,
	fill_balls: int,
	total:      int,
}

Error :: enum {
	None,
	Game_Over,
	Game_Not_Over,
	Roll_Not_Between_1_And_10,
	Rolls_in_Frame_Exceed_10_Points,
}

new_game :: proc() -> Game {
	return Game{frame = 1, standing = 10}
}

roll :: proc(g: ^Game, pins: int) -> Error {
	if game_over(g^)         do return .Game_Over
	if pins < 0 || pins > 10 do return .Roll_Not_Between_1_And_10
	if pins > g.standing     do return .Rolls_in_Frame_Exceed_10_Points

	x := g.frame <= 10 ? g.bonus[g.ball] : max(0, g.bonus[0] - g.frame + 10)
	g.total += (1 + x) * pins
	g.bonus[g.ball] = 0
	g.standing -= pins

	if g.standing == 0 {
		if g.frame == 10 do g.fill_balls = 2 - g.ball
		if g.ball == 0 {
			g.bonus[0] = 1 + g.bonus[1]
			g.bonus[1] = 1
			g.ball = 1
		} else {
			g.bonus[0] = 1
		}
	}

	if g.frame > 10 do g.fill_balls -= 1

	g.ball = 1 - g.ball
	if g.ball == 0 {
		g.frame += 1
		g.standing = 10
	}

	return .None
}

score :: proc(b: Game) -> (int, Error) {
	if !game_over(b) do return 0, .Game_Not_Over
	return b.total, .None
}

game_over :: proc(b: Game) -> bool {
	return b.frame > 10 && b.fill_balls == 0
}
