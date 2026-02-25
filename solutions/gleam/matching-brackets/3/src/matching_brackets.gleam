import gleam/list
import gleam/result
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let symbols = string.to_graphemes(value)
  case list.try_fold(symbols, [], process_symbols) {
    Error(_) -> False
    Ok(unpaired) -> unpaired == []
  }
}

fn process_symbols(
  brackets: List(String),
  next_symbol: String,
) -> Result(List(String), Nil) {
  case next_symbol {
    "[" | "(" | "{" -> Ok([next_symbol, ..brackets])
    "]" | "}" | ")" -> {
      let expected_opening = case next_symbol {
        "]" -> "["
        "}" -> "{"
        ")" -> "("
        _ -> panic as "Never gonna happen"
      }
      pop_matching_bracket(brackets, expected_opening)
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
    Ok(last_opening) ->
      case last_opening == expected_opening {
        False -> Error(Nil)
        True -> result.or(list.rest(brackets), Ok([]))
      }
  }
}
