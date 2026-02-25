import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let sentence = string.lowercase(sentence)

  "abcdefghijklmnopqrstuvwxyz"
  |> string.to_graphemes
  |> list.all(fn(char) { string.contains(does: sentence, contain: char) })
}
