import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> rest -> message(rest)
    "[WARNING]: " <> rest -> message(rest)
    "[ERROR]: " <> rest -> message(rest)
    _ -> string.trim(log_line)
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    "[ERROR]: " <> _ -> "error"
    _ -> string.trim(log_line)
  }
}

pub fn reformat(log_line: String) -> String {
  let level = log_level(log_line)
  let message = message(log_line)
  message <> " (" <> level <> ")"
}
