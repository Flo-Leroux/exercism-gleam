import gleam/regex
import gleam/string

pub fn hey(remark: String) -> String {
  let assert Ok(letter_regex) = regex.from_string("[a-zA-Z]")

  let trimed = string.trim(remark)
  let has_letter = regex.check(letter_regex, trimed)
  let is_question = string.ends_with(trimed, "?")
  let is_all_upper = string.uppercase(trimed) == trimed
  let is_empty = string.is_empty(trimed)

  case remark {
    _ if is_empty -> "Fine. Be that way!"
    _ if is_question && is_all_upper && has_letter ->
      "Calm down, I know what I'm doing!"
    _ if is_question -> "Sure."
    _ if is_all_upper && has_letter -> "Whoa, chill out!"
    _ -> "Whatever."
  }
}
