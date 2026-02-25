import gleam/int
import gleam/result

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

fn colors_to_code(first_color: Color, second_color: Color) {
  int.undigits([code(first_color), code(second_color)], 10)
  |> result.try_recover(fn(_) { Error(Nil) })
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [f, s, ..] -> colors_to_code(f, s)
    [_] -> Error(Nil)
    [] -> Error(Nil)
  }
}
