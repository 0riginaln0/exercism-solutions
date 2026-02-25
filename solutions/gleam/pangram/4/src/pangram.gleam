import gleam/list
import gleam/string.{contains, lowercase, to_graphemes}

pub fn is_pangram(sentence: String) -> Bool {
  let sentence = lowercase(sentence)

  "abcdefghijklmnopqrstuvwxyz"
  |> to_graphemes()
  |> list.all(contains(does: sentence, contain: _))
}
