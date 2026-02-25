import gleam/list

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  let assert [first, second, zeros_to_add, ..] = list.map(colors, encode_color)

  case first, second, zeros_to_add {
    0, 0, _ -> {
      Ok(Resistance("ohms", 0))
    }
    f, 0, z -> {
      let #(unit, value_multiply_with_for_adding_zeros) = resolve_unit(z + 1)
      Ok(Resistance(unit, f * value_multiply_with_for_adding_zeros))
    }
    f, s, z -> {
      let #(unit, value_multiply_with_for_adding_zeros) = resolve_unit(z)
      Ok(Resistance(unit, { f * 10 + s } * value_multiply_with_for_adding_zeros))
    }
    -1, _, _ | _, -1, _ | _, _, -1 -> Error(Nil)
  }
}

fn encode_color(color: String) -> Int {
  case color {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> -1
  }
}

fn resolve_unit(n: Int) -> #(String, Int) {
  let ohms = "ohms"
  case n {
    0 -> #(ohms, 1)
    1 -> #(ohms, 10)
    2 -> #(ohms, 100)
    3 -> #("kilo" <> ohms, 1)
    4 -> #("kilo" <> ohms, 10)
    5 -> #("kilo" <> ohms, 100)
    6 -> #("mega" <> ohms, 1)
    7 -> #("mega" <> ohms, 10)
    8 -> #("mega" <> ohms, 100)
    9 -> #("giga" <> ohms, 1)
    // Should not be ever run
    _ -> #(ohms, 1)
  }
}
