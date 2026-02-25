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
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let robot = create(direction, position)
  string.to_graphemes(instructions)
  |> list.fold(robot, move_robot)
}

fn move_robot(robot: Robot, command: String) -> Robot {
  case command {
    "A" -> advance(robot)
    "R" -> right(robot)
    "L" -> left(robot)
    _ -> robot
  }
}

fn advance(robot: Robot) -> Robot {
  case robot.direction {
    North ->
      Robot(
        ..robot,
        position: Position(..robot.position, y: robot.position.y + 1),
      )
    East ->
      Robot(
        ..robot,
        position: Position(..robot.position, x: robot.position.x + 1),
      )
    South ->
      Robot(
        ..robot,
        position: Position(..robot.position, y: robot.position.y - 1),
      )
    West ->
      Robot(
        ..robot,
        position: Position(..robot.position, x: robot.position.x - 1),
      )
  }
}

fn right(robot: Robot) -> Robot {
  case robot.direction {
    North -> Robot(..robot, direction: East)
    East -> Robot(..robot, direction: South)
    South -> Robot(..robot, direction: West)
    West -> Robot(..robot, direction: North)
  }
}

fn left(robot: Robot) -> Robot {
  case robot.direction {
    North -> Robot(..robot, direction: West)
    East -> Robot(..robot, direction: North)
    South -> Robot(..robot, direction: East)
    West -> Robot(..robot, direction: South)
  }
}
