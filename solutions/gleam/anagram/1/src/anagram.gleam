import gleam/int
import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let word = string.lowercase(word)
  list.filter(candidates, is_anagram(_, of: word))
}

fn is_anagram(candidate: String, of word: String) -> Bool {
  let word_letters =
    word
    |> string.lowercase
    |> string.to_utf_codepoints
    |> list.map(string.utf_codepoint_to_int)
    |> list.sort(int.compare)
  let candidate_letters =
    candidate
    |> string.lowercase
    |> string.to_utf_codepoints
    |> list.map(string.utf_codepoint_to_int)
    |> list.sort(int.compare)

  word_letters == candidate_letters
  && string.lowercase(candidate) != string.lowercase(word)
}
