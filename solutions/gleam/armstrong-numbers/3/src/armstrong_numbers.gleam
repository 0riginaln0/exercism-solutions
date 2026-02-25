import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let #(digits, number_of_digits) = decompose_number(number, [], 0)

  digits
  |> list.map(fn(x) { int_power(x, new(number_of_digits)) })
  |> list.fold(0, int.add)
  |> fn(n) { n == number }
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
  case to_int(exponent) {
    0 -> 1
    e -> base * int_power(base, new(e - 1))
  }
}

pub opaque type Natural {
  Natural(inner: Int)
}

pub fn new(i: Int) -> Natural {
  case i >= 0 {
    True -> Natural(i)
    False -> Natural(0)
  }
}

pub fn to_int(i: Natural) -> Int {
  i.inner
}
