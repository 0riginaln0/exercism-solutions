import gleam/int
import gleam/list as l
import gleam/result

pub fn square_of_sum(n: Int) -> Int {
  let list = create_list([n])
  let sum = sum_list(list, 0)
  sum * sum
}

fn create_list(list: List(Int)) -> List(Int) {
  case list {
    [first, ..] if first == 1 -> list
    [first, ..] -> create_list(l.append([first - 1], list))
    [] -> list // cannot be reachable pls
  }
}

fn sum_list(list: List(Int), total: Int) -> Int {
  case list {
    [first, ..rest] -> sum_list(rest, total + first)
    [] -> total
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  let list = create_list([n])
  let squares_list = l.map(list, fn(x) { x * x })
  l.fold(squares_list, 0, fn(count, e) { count + e })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
