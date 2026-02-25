import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  simplifile.read(path)
  |> result.map(fn(raw_text) { string.split(string.trim(raw_text), "\n") })
  |> result.nil_error
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path)
  |> result.nil_error
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n")
  |> result.nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  // case create_log_file(log_path) {
  //   Error(Nil) -> Error(Nil)
  //   Ok(Nil) ->
  //     case read_emails(emails_path) {
  //       Error(_) -> Error(Nil)
  //       Ok(emails) -> {
  //         list.try_each(emails, fn(email) {
  //           case send_email(email) {
  //             Error(Nil) -> Ok(Nil)
  //             Ok(Nil) -> log_sent_email(log_path, email)
  //           }
  //         })
  //       }
  //     }
  // }

  use _ <- result.try(create_log_file(log_path))
  use emails <- result.try(read_emails(emails_path))
  use email <- list.try_each(emails)
  case send_email(email) {
    Ok(_) -> log_sent_email(log_path, email)
    // Error(_) -> Ok(Nil) because we need to iterate over ALL emails.
    // If we return Error(Nil) the try_each() will stop iterating and will return Error(Nil)
    Error(_) -> Ok(Nil)
  }
}
