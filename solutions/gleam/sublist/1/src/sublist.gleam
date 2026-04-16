import gleam/bool
import gleam/list

pub type Comparison {
  Equal
  Sublist
  Superlist
  Unequal
}

pub fn sublist(compare a: List(a), to b: List(a)) -> Comparison {
  use <- bool.guard(a == b, Equal)
  let #(len_a, len_b) = #(list.length(a), list.length(b))
  use <- bool.guard(len_a < len_b, case is_sublist(a, b) {
    True -> Sublist
    False -> Unequal
  })
  use <- bool.guard(len_a > len_b, case is_sublist(b, a) {
    True -> Superlist
    False -> Unequal
  })
  Unequal
}

fn is_sublist(l1, l2) {
  case l2 {
    [] -> False
    [_, ..rest] -> {
      case starts_with(l1, l2) {
        True -> True
        False -> is_sublist(l1, rest)
      }
    }
  }
}

fn starts_with(prefix, list) {
  case prefix, list {
    [], _ -> True
    [x, ..xs], [y, ..ys] if x == y -> starts_with(xs, ys)
    _, _ -> False
  }
}
