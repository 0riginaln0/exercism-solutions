import gleam/dict.{type Dict}
import gleam/list
import gleam/regexp
import gleam/string

pub fn count_words(input: String) -> Dict(String, Int) {
  let assert Ok(re) = regexp.from_string("[A-Za-z0-9]+(?:'[A-Za-z0-9]+)?")
  input
  |> regexp.scan(re, _)
  |> list.map(fn(m) { string.lowercase(m.content) })
  |> list.fold(dict.new(), fn(dictionary, word) {
    case dict.get(dictionary, word) {
      Error(_) -> dict.insert(dictionary, word, 1)
      Ok(counter) -> dict.insert(dictionary, word, counter + 1)
    }
  })
}
