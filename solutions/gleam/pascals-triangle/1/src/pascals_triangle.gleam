import gleam/int
import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  do_rows(n, [[1]], [1])
}

fn do_rows(n: Int, acc: List(List(Int)), last: List(Int)) -> List(List(Int)) {
  case n {
    0 -> []
    1 -> list.reverse(acc)
    _ -> {
      let row: List(Int) = list.window(last, 2) |> list.map(int.sum)
      let new_last: List(Int) = list.concat([[1], row, [1]])
      do_rows(n - 1, [new_last, ..acc], new_last)
    }
  }
}
