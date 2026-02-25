import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, is_anagram(_, of: word))
}

fn is_anagram(candidate: String, of word: String) -> Bool {
  let word = string.lowercase(word)
  let candidate = string.lowercase(candidate)

  word != candidate
  && {
    let w_chars = word |> string.to_graphemes |> list.sort(string.compare)
    let c_chars = candidate |> string.to_graphemes |> list.sort(string.compare)
    w_chars == c_chars
  }
}
