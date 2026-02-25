import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  use new_dict, points, letters <- dict.fold(over: legacy, from: dict.new())
  use new_dict, letter <- list.fold(over: letters, from: new_dict)
  dict.insert(into: new_dict, for: string.lowercase(letter), insert: points)
}

