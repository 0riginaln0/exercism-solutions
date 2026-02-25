import gleam/list

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  let assert [first, second, zeros_to_add, ..] = list.map(colors, encode_color)

  case first, second, zeros_to_add {
    Ok(0), Ok(0), Ok(_) -> {
      Ok(Resistance("ohms", 0))
    }
    Ok(f), Ok(0), Ok(z) -> {
      let #(unit, value_multiply_with_for_adding_zeros) = resolve_unit(z + 1)
      Ok(Resistance(unit, f * value_multiply_with_for_adding_zeros))
    }
    Ok(f), Ok(s), Ok(z) -> {
      let #(unit, value_multiply_with_for_adding_zeros) = resolve_unit(z)
      Ok(Resistance(unit, { f * 10 + s } * value_multiply_with_for_adding_zeros))
    }
    _, _, _ -> Error(Nil)
  }
}

fn encode_color(color: String) -> Result(Int, Nil) {
  case color {
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
