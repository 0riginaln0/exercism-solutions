import gleam/list.{unique}
import gleam/string.{lowercase, to_graphemes}

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> lowercase()
  |> to_graphemes()
  |> list.filter(fn(char) { char != "-" && char != " " })
  |> fn(chars) { chars == unique(chars) }
}
