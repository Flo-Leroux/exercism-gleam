import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let formatted =
    phrase
    |> string.lowercase
    |> string.replace(each: "-", with: "")
    |> string.replace(each: " ", with: "")
    |> string.to_graphemes

  formatted
  |> list.unique
  |> list.length
  |> fn(x) { x == list.length(formatted) }
}
