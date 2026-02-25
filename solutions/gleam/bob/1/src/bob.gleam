import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)

  let is_question = string.ends_with(remark, "?")
  let is_yell = {remark == string.uppercase(remark)} && {remark != string.lowercase(remark)}
  let is_silence = string.trim(remark) == ""

  case is_question, is_yell, is_silence {
    False, False, True -> "Fine. Be that way!"
    True, True, False -> "Calm down, I know what I'm doing!"
    False, True, False -> "Whoa, chill out!"
    True, False, False -> "Sure."
    _, _, _ -> "Whatever."
  }
}
