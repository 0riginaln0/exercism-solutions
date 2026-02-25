import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) -> String {
  name
  |> string.trim_left()
  |> string.first()
  |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  name
  |> first_letter()
  |> string.uppercase()
  |> string.append(".")
}

pub fn initials(full_name: String) -> String {
  full_name
  |> string.trim()
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) -> String {
  let heart_top =
    "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     "
  let heart_bottom =
    "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
  heart_top
  <> initials(full_name1)
  <> "  +  "
  <> initials(full_name2)
  <> heart_bottom
}
