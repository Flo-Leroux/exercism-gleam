import gleam/io
import gleam/list
import gleam/string

fn alphabet(letter: String) -> List(String) {
  string.to_graphemes("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  |> list.take_while(fn(x) { x != letter })
  |> list.append([letter])
}

fn get_row_length(letter: String) -> Int {
  alphabet(letter)
  |> list.length
  |> fn(lgth) { lgth * 2 - 1 }
}

fn generate_top(letter: String) -> List(String) {
  let row_length = get_row_length(letter)

  alphabet(letter)
  |> list.index_map(fn(ltr, idx) {
    let spacing = { idx - 1 } * 2 + 1
    case idx {
      0 -> [ltr]
      _ -> list.concat([[ltr], list.repeat(" ", spacing), [ltr]])
    }
  })
  |> list.map(fn(items) {
    let before = { row_length - list.length(items) } / 2

    list.concat([list.repeat(" ", before), items, list.repeat(" ", before)])
  })
  |> list.map(fn(row) { string.join(row, "") })
}

fn diamons_rows(letter: String) -> List(String) {
  let rows = generate_top(letter)
  let symetrics =
    rows
    |> list.take_while(fn(a) { string.starts_with(a, " ") })
    |> list.reverse

  list.concat([rows, symetrics])
}

pub fn build(letter: String) -> String {
  diamons_rows(letter)
  |> string.join("\n")
}

pub fn main() {
  diamons_rows("E")
  |> list.each(io.debug)
}
