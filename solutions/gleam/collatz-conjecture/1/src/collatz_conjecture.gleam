pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    False -> Error(NonPositiveNumber)
    True -> Ok(collatz_conjectur_steps(number, 0))
  }
}

fn collatz_conjectur_steps(number, steps_count) -> Int {
  case number {
    1 -> steps_count
    n if n % 2 == 0 -> collatz_conjectur_steps(n / 2, steps_count + 1)
    n -> collatz_conjectur_steps(n * 3 + 1, steps_count + 1)
  }
}
