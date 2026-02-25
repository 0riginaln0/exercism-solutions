import gleam/dict
import gleam/int
import gleam/list

pub fn lowest_price(books: List(Int)) -> Float {
  let assert [a, b, c, d, e] =
    books
    |> list.group(by: fn(i) { i })
    |> dict.map_values(fn(_, v) { list.length(v) })
    |> dict.merge(
      dict.from_list([#(1, 0), #(2, 0), #(3, 0), #(4, 0), #(5, 0)]),
      _,
    )
    |> dict.values()
    |> list.sort(by: int.compare)

  let groups_of_five = a
  let groups_of_four = b - a
  let groups_of_three = c - b
  let groups_of_two = d - c
  let groups_of_one = e - d

  let #(groups_of_five, groups_of_four, groups_of_three) = case
    groups_of_five,
    groups_of_four,
    groups_of_three
  {
    groups_of_five, groups_of_four, groups_of_three
      if groups_of_five > groups_of_three
    -> #(
      groups_of_five - groups_of_three,
      groups_of_four + groups_of_three * 2,
      0,
    )
    groups_of_five, groups_of_four, groups_of_three -> #(
      0,
      groups_of_four + groups_of_five * 2,
      groups_of_three - groups_of_five,
    )
  }

  int.to_float(groups_of_five)
  *. 5.0
  *. 0.75
  *. 800.0
  +. int.to_float(groups_of_four)
  *. 4.0
  *. 0.8
  *. 800.0
  +. int.to_float(groups_of_three)
  *. 3.0
  *. 0.9
  *. 800.0
  +. int.to_float(groups_of_two)
  *. 2.0
  *. 0.95
  *. 800.0
  +. int.to_float(groups_of_one)
  *. 800.0

  // I don't understand that shit above
  1.7 +. 5.2
}
