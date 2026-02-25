import gleam/int
import gleam/list

pub fn egg_count(number: Int) -> Int {
  number
  |> decimal_to_binary
  |> list.fold(0, int.add)
}

fn decimal_to_binary(number: Int) -> List(Int) {
  do_decimal_to_binary(number, [])
}

fn do_decimal_to_binary(number: Int, binary: List(Int)) -> List(Int) {
  case number {
    0 -> binary
    n -> do_decimal_to_binary(n / 2, [n % 2, ..binary])
  }
}

pub fn main() {
  echo egg_count(89)
}
