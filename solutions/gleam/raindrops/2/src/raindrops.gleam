import gleam/int

pub fn convert(number: Int) -> String {
  let is_divisible_by_3 = number % 3 == 0
  let is_divisible_by_5 = number % 5 == 0
  let is_divisible_by_7 = number % 7 == 0

  case number {
    _ if is_divisible_by_3 ->
      case number {
        _ if is_divisible_by_5 && is_divisible_by_7 -> "PlingPlangPlong"
        _ if is_divisible_by_5 -> "PlingPlang"
        _ if is_divisible_by_7 -> "PlingPlong"
        _ -> "Pling"
      }
    _ if is_divisible_by_5 ->
      case number {
        _ if is_divisible_by_7 -> "PlangPlong"
        _ -> "Plang"
      }
    _ if is_divisible_by_7 -> "Plong"
    _ -> int.to_string(number)
  }
}
