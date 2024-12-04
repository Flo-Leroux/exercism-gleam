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

fn turn_left(robot rob: Robot) -> Robot {
  case rob.direction {
    North -> Robot(..rob, direction: West)
    East -> Robot(..rob, direction: North)
    South -> Robot(..rob, direction: East)
    West -> Robot(..rob, direction: South)
  }
}

fn turn_right(robot rob: Robot) -> Robot {
  case rob.direction {
    North -> Robot(..rob, direction: East)
    East -> Robot(..rob, direction: South)
    South -> Robot(..rob, direction: West)
    West -> Robot(..rob, direction: North)
  }
}

fn advance(robot rob: Robot) -> Robot {
  let position = case rob.direction {
    North -> Position(x: rob.position.x, y: rob.position.y + 1)
    East -> Position(x: rob.position.x + 1, y: rob.position.y)
    South -> Position(x: rob.position.x, y: rob.position.y - 1)
    West -> Position(x: rob.position.x - 1, y: rob.position.y)
  }

  Robot(..rob, position: position)
}

fn run(robot rob: Robot, instructions instructions: String) -> Robot {
  let rob = case instructions {
    "L" <> _ -> turn_left(rob)
    "R" <> _ -> turn_right(rob)
    "A" <> _ -> advance(rob)
    _ -> rob
  }

  case instructions {
    "L" <> next | "R" <> next | "A" <> next -> run(rob, next)
    _ -> rob
  }
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  create(direction, position)
  |> run(instructions)
}
