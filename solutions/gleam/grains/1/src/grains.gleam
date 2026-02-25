import gleam/int
import gleam/list
import gleam/result

pub type Error {
  InvalidSquare
}

fn double(what x, times count) {
  case count {
    0 -> x
    _ -> double(x * 2, count - 1)
  }
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square == 0 || square > 64 || square < 0 {
    False -> Ok(double(what: 1, times: square - 1))
    True -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  list.range(1, 64)
  |> list.try_map(square)
  |> result.unwrap([])
  |> int.sum
}
