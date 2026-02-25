// TODO: please define the 'Coach' type
pub type Coach {
  Coach(name: String, former_player: Bool)
}

// TODO: please define the 'Stats' type
pub type Stats {
  Stats(wins: Int, losses: Int)
}

// TODO: please define the 'Team' type
pub type Team {
  Team(name: String, coach: Coach, stats: Stats)
}

pub fn create_coach(name: String, former_player: Bool) -> Coach {
  Coach(name: name, former_player: former_player)
}

pub fn create_stats(wins: Int, losses: Int) -> Stats {
  Stats(wins: wins, losses: losses)
}

pub fn create_team(name: String, coach: Coach, stats: Stats) -> Team {
  Team(name: name, coach: coach, stats: stats)
}

pub fn replace_coach(team: Team, coach: Coach) -> Team {
  Team(..team, coach: coach)
}

pub fn is_same_team(home_team: Team, away_team: Team) -> Bool {
  home_team == away_team
}

pub fn root_for_team(team: Team) -> Bool {
  // If one of the following is True, you root for that team:
  case team {
    // The coach's name is "Gregg Popovich"
    Team(coach: Coach(name: n, ..), ..) if n == "Gregg Popovich" -> True
    // The coach is a former player
    Team(coach: Coach(former_player: fp, ..), ..) if fp -> True
    // The team's name is the "Chicago Bulls"
    Team(name: n, ..) if n == "Chicago Bulls" -> True
    // The team has won 60 or more games
    Team(stats: Stats(wins: w, ..), ..) if w > 60 -> True
    // The team has more losses than wins
    Team(stats: Stats(wins: w, losses: l), ..) if l > w -> True
    _ -> False
  }
}
