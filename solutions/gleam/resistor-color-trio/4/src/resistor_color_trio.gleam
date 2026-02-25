import gleam/int
import gleam/list
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn code(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

fn string_to_color(str: String) -> Result(Color, Nil) {
  case str {
    "black" -> Ok(Black)
    "brown" -> Ok(Brown)
    "red" -> Ok(Red)
    "orange" -> Ok(Orange)
    "yellow" -> Ok(Yellow)
    "green" -> Ok(Green)
    "blue" -> Ok(Blue)
    "violet" -> Ok(Violet)
    "grey" -> Ok(Grey)
    "white" -> Ok(White)
    _ -> Error(Nil)
  }
}

fn string_to_code(str) -> Result(Int, Nil) {
  string_to_color(str)
  |> result.map(code)
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
  case list.try_map(colors, string_to_code) {
    Ok([d1, d2, d3, ..]) -> Ok(digits_to_res(d1, d2, d3))
    _ -> Error(Nil)
  }
}
