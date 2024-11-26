import gleam/int
import gleam/io

pub fn convert(number: Int) -> String {
  let raindrops = ""

  let raindrops = case number % 3 {
    0 -> raindrops <> "Pling"
    _ -> raindrops
  }

  let raindrops = case number % 5 {
    0 -> raindrops <> "Plang"
    _ -> raindrops
  }

  let raindrops = case number % 7 {
    0 -> raindrops <> "Plong"
    _ -> raindrops
  }

  case raindrops != "" {
    True -> raindrops
    False -> int.to_string(number)
  }
}

pub fn main() {
  let res = convert(34)
  io.debug(res)
}
