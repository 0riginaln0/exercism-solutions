import gleam/bool
import gleam/int
import gleam/order.{Eq, Gt, Lt}
import gleam/yielder

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- bool.guard(when: number < 1, return: Error(NonPositiveInt))

  let aliquot_sum =
    yielder.range(1, number / 2)
    |> yielder.filter(fn(x) { number % x == 0 && x != number })
    |> yielder.to_list()
    |> int.sum

  case int.compare(aliquot_sum, number) {
    Gt -> Ok(Abundant)
    Lt -> Ok(Deficient)
    Eq -> Ok(Perfect)
  }
}
