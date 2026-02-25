pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  map(list, [], fun)
}

fn map(input_list: List(a), output_list: List(b), fun: fn(a) -> b) -> List(b) {
  case input_list {
    [] -> reverse(output_list)
    [element, ..rest] -> map(rest, [fun(element), ..output_list], fun)
  }
}

fn reverse(list: List(a)) -> List(a) {
  reverse_tco(list, [])
}

fn reverse_tco(list: List(a), output_list: List(a)) -> List(a) {
  case list {
    [] -> output_list
    [element, ..rest] -> reverse_tco(rest, [element, ..output_list])
  }
}
