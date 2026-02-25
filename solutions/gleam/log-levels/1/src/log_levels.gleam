import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> rest -> string.trim(rest)
    "[WARNING]:" <> rest -> string.trim(rest)
    "[INFO]:" <> rest -> string.trim(rest)
    _ -> "Invalid log type"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]" <> rest -> "error"
    "[WARNING]" <> rest -> "warning"
    "[INFO]" <> rest -> "info"
    _ -> "Invalid log type"
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> rest -> string.trim(rest)
                          |> string.append(" (error)")
    "[WARNING]:" <> rest -> string.trim(rest)
                          |> string.append(" (warning)")
    "[INFO]:" <> rest -> string.trim(rest)
                          |> string.append(" (info)")
    _ -> "Invalid log type"
  }
}
