import gleam/bool.{guard}
import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let string_length = string.length(input)
  use <- guard(string_length == 0, return: Error(EmptySeries))
  use <- guard(when: string_length < size, return: Error(SliceLengthTooLarge))
  use <- guard(when: size == 0, return: Error(SliceLengthZero))
  use <- guard(when: size < 0, return: Error(SliceLengthNegative))

  list.range(0, string_length - size)
  |> list.map(fn(n) { string.slice(from: input, at_index: n, length: size) })
  |> Ok
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
