import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  use new_dict, points, letters <- dict.fold(legacy, dict.new())
  use new_dict, letter <- list.fold(letters, new_dict)
  dict.insert(new_dict, string.lowercase(letter), points)
}

