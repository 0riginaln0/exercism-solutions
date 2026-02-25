import gleam/list.{fold, strict_zip}
import gleam/result.{try}
import gleam/string.{to_graphemes}

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  use letter_pairs <- try(strict_zip(
    to_graphemes(strand1),
    to_graphemes(strand2),
  ))
  fold(over: letter_pairs, from: 0, with: fn(d, letter_pair) {
    case letter_pair {
      #(l1, l2) if l1 != l2 -> d + 1
      _ -> d
    }
  })
  |> Ok
}
