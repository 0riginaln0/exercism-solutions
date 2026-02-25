import gleam/int
import gleam/list
import gleam/order

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  case list.reverse(high_scores) {
    [] -> Error(Nil)
    [latest, ..] -> Ok(latest)
  }
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  case high_scores {
    [] -> Error(Nil)
    [first, ..rest] ->
      list.fold(
        over: rest,
        from: first,
        with: fn(current_highest_score, next_score) {
          case current_highest_score < next_score {
            True -> next_score
            False -> current_highest_score
          }
        },
      )
      |> Ok
  }
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
