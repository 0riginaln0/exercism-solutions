import gleam/string
import gleam/dict.{type Dict}
import gleam/list

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.fold(legacy, dict.new(), fn(new_dict, points, letters) {
    list.fold(letters, new_dict, fn(new_dict, letter) {
      dict.insert(new_dict, letter |> string.lowercase, points)
    })
  })
}

