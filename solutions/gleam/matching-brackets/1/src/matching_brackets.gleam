import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let symbols = string.to_graphemes(value)
  case list.try_fold(symbols, [], update_brackets) {
    Error(_) -> False
    Ok(unpaired) -> unpaired == []
  }
}

fn update_brackets(
  brackets: List(String),
  next_symbol: String,
) -> Result(List(String), Nil) {
  case next_symbol {
    "[" | "(" | "{" -> Ok([next_symbol, ..brackets])
    "]" | "}" | ")" -> {
      let expected = case next_symbol {
        "]" -> "["
        "}" -> "{"
        ")" -> "("
        _ -> panic as "Never gonna happen"
      }

      pop_matching_bracket(brackets, expected)
    }
    _ -> Ok(brackets)
  }
}

fn pop_matching_bracket(
  brackets: List(String),
  expected_opening: String,
) -> Result(List(String), Nil) {
  case list.first(brackets) {
    Error(_) -> Error(Nil)
    Ok(last_opened_bracket) ->
      case last_opened_bracket == expected_opening {
        False -> Error(Nil)
        True -> list.rest(brackets)
      }
  }
}
