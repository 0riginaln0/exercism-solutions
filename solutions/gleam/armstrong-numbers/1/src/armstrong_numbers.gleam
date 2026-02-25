import gleam/int
import gleam/list
import natural.{type Natural}

pub fn is_armstrong_number(number: Int) -> Bool {
  let #(digits, number_of_digits) = decompose_number(number, [], 0)

  let powed =
    digits
    |> list.map(fn(x) { int_power(x, natural.new(number_of_digits)) })
    |> list.fold(0, int.add)

  powed == number
}

fn decompose_number(
  number: Int,
  digits: List(Int),
  number_of_digits: Int,
) -> #(List(Int), Int) {
  let n = number / 10
  case n {
    0 -> #([number, ..digits], number_of_digits + 1)
    _ -> decompose_number(n, [number % 10, ..digits], number_of_digits + 1)
  }
}

fn int_power(base: Int, exponent: Natural) -> Int {
  case natural.to_int(exponent) {
    0 -> 1
    e -> base * int_power(base, natural.new(e - 1))
  }
}
