import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction: direction, position: position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  string.to_graphemes(instructions)
  |> list.fold(create(direction, position), move_robot)
}

fn move_robot(robot: Robot, command: String) -> Robot {
  case command {
    "A" -> advance(robot)
    "R" -> right(robot)
    "L" -> left(robot)
    _ -> robot
  }
}

fn advance(robot r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, position: Position(..r.position, y: r.position.y + 1))
    East -> Robot(..r, position: Position(..r.position, x: r.position.x + 1))
    South -> Robot(..r, position: Position(..r.position, y: r.position.y - 1))
    West -> Robot(..r, position: Position(..r.position, x: r.position.x - 1))
  }
}

fn right(robot r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, direction: East)
    East -> Robot(..r, direction: South)
    South -> Robot(..r, direction: West)
    West -> Robot(..r, direction: North)
  }
}

fn left(robot r: Robot) -> Robot {
  case r.direction {
    North -> Robot(..r, direction: West)
    East -> Robot(..r, direction: North)
    South -> Robot(..r, direction: East)
    West -> Robot(..r, direction: South)
  }
}
