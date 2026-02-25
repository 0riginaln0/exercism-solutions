import gleam/option.{Some}
import gleam/regex.{Match}

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(valid) = regex.from_string("^\\[(DEBUG|INFO|WARNING|ERROR)\\]")
  regex.check(valid, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(separator) = regex.from_string("\\<[\\~\\*\\=\\-]*\\>")
  regex.split(separator, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(with_username) = regex.from_string("User\\s+(\\S+)")
  case regex.scan(with_username, line) {
    [] -> line
    [Match(content: _, submatches: [Some(name)])] ->
      "[USER] " <> name <> " " <> line
    _ -> panic
  }
}
