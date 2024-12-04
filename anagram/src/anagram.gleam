import gleam/list
import gleam/string

fn format(word word: String) -> String {
  word
  |> string.lowercase
  |> string.to_graphemes
  |> list.sort(by: string.compare)
  |> string.join(with: "")
}

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let formatted = word |> format
  let lowercase = word |> string.lowercase

  candidates
  |> list.filter(fn(candidate) {
    formatted == candidate |> format
    && lowercase != candidate |> string.lowercase
  })
}
