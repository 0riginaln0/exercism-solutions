import gleam/int
import gleam/list
import gleam/string

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn code(color: String) -> Result(Int, Nil) {
  case string.lowercase(color) {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}

fn digits_to_res(d1, d2, d3: Int) -> Resistance {
  let assert Ok(num) = int.undigits([d1, d2, ..list.repeat(0, d3)], 10)
  case d3 + 2 {
    //2 digits before the zeros
    x if x > 9 -> Resistance("gigaohms", num / 1_000_000_000)
    x if x > 6 -> Resistance("megaohms", num / 1_000_000)
    x if x > 3 -> Resistance("kiloohms", num / 1000)
    _ -> Resistance("ohms", num)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case list.try_map(colors, code) {
    Ok([d1, d2, d3, ..]) -> Ok(digits_to_res(d1, d2, d3))
    _ -> Error(Nil)
  }
}
