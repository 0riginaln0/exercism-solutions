import gleam/int
import gleam/list
import gleam/order

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  list.last(high_scores)
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  list.max(high_scores, int.compare)
}

pub fn personal_top_three(high_scores: List(Int)) -> List(Int) {
  high_scores
  |> list.sort(int_compare_negation)
  |> list.take(3)
}

fn int_compare_negation(a: Int, with b: Int) -> order.Order {
  case int.compare(a, b) {
    order.Eq -> order.Eq
    order.Gt -> order.Lt
    order.Lt -> order.Gt
  }
}
