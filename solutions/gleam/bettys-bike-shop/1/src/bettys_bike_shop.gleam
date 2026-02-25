import gleam/int
import gleam/float
// TODO: import the `gleam/string` module

pub fn pence_to_pounds(pence: Int) -> Float {
  let pounds =int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds: Float) -> String {
  "£" <> float.to_string(pounds)
}
