import gleam/bool.{guard}
import gleam/float
import gleam/int
import gleam/list
import gleam/order.{Eq, Gt, Lt}
import gleam/result
import gleam/yielder

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn aliquot(n: Int) -> Int {
  let sqrt_n =
    int.square_root(n)
    |> result.unwrap(0.0)
    |> float.floor()
    |> float.truncate()
  let divisor_pairs =
    list.range(1, sqrt_n + 1)
    |> list.filter(fn(i) { n % i == 0 })
    |> list.flat_map(fn(i) {
      case i != n / i {
        True ->
          case n / i == n {
            True -> [i]
            False -> [i, n / i]
          }
        False -> [i]
      }
    })
  echo divisor_pairs
  int.sum(divisor_pairs)
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- guard(when: number <= 0, return: Error(NonPositiveInt))
  case int.compare(number, aliquot(number)) {
    Eq -> Ok(Perfect)
    Lt -> Ok(Abundant)
    Gt -> Ok(Deficient)
  }
}

pub fn main() {
  echo classify(6)
}
