import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  map(list, [], fun)
}

fn map(input_list: List(a), output_list: List(b), fun: fn(a) -> b) -> List(b) {
  case input_list {
    [] -> list.reverse(output_list)
    [element, ..rest] -> map(rest, [fun(element), ..output_list], fun)
  }
}
