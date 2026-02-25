import gleam/int
import gleam/list.{filter, flatten, map, unique}
import gleam/yielder.{Next}

pub fn sum(factors base_values: List(Int), limit level: Int) -> Int {
  base_values
  |> filter(keeping: fn(base_value) { base_value != 0 })
  |> map(with: fn(base_value) {
    yielder.unfold(from: 1, with: fn(counter) {
      Next(element: base_value * counter, accumulator: counter + 1)
    })
    |> yielder.take_while(satisfying: fn(multiplier) { multiplier < level })
    |> yielder.to_list()
  })
  |> flatten
  |> unique
  |> int.sum
}
