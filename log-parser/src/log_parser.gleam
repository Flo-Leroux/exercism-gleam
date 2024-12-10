import gleam/list
import gleam/option
import gleam/regex

pub fn is_valid_line(line: String) -> Bool {
  let options = regex.Options(case_insensitive: False, multi_line: False)
  let assert Ok(re) =
    regex.compile("\\[DEBUG|INFO|WARNING|ERROR\\]", with: options)
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let options = regex.Options(case_insensitive: True, multi_line: False)
  let assert Ok(re) = regex.compile("<[~*=-]*>", with: options)

  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let options = regex.Options(case_insensitive: True, multi_line: True)
  let assert Ok(re) = regex.compile("User[\\s\t\r]+(\\S+)", with: options)

  let username =
    regex.scan(re, line)
    |> list.flat_map(fn(x) { x.submatches })
    |> list.filter_map(fn(x) {
      case x {
        option.Some(n) -> Ok(n)
        _ -> Error(x)
      }
    })
    |> list.first

  case username {
    Ok(name) -> "[USER] " <> name <> " " <> line
    _ -> line
  }
}
