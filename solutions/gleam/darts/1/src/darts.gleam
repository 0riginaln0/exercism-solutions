import gleam/float.{absolute_value, power}
import gleam/result.{unwrap}

pub fn score(x: Float, y: Float) -> Int {
  let x = absolute_value(x)
  let y = float.absolute_value(y)

  // d=√((x2 – x1)² + (y2 – y1)²)
  let distance =
    power(unwrap(power(x, 2.0), 0.0) +. unwrap(power(y, 2.0), 0.0), 0.5)

  case distance {
    Ok(d) if d >. 10.0 -> 0
    Ok(d) if d >. 5.0 -> 1
    Ok(d) if d >. 1.0 -> 5
    Ok(_) -> 10
    // should never fail
    Error(_) -> 0
  }
}
