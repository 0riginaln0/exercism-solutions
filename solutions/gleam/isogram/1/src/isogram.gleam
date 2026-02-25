import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(fn(char) { char != "-" && char != " " })
  |> fn(chars) { chars == list.unique(chars) }
}