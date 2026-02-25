import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let sentence = string.lowercase(sentence)

  "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes()
  |> list.all(string.contains(does: sentence, contain: _))
}
