import gleam/int
import gleam/io
import gleam/string

fn raindrop(
  crt_sound: String,
  number: Int,
  divisor: Int,
  sound: String,
) -> String {
  case number % divisor {
    0 -> crt_sound <> sound
    _ -> crt_sound
  }
}

fn default_on_empty(crt_sound: String, default: String) -> String {
  case string.is_empty(crt_sound) {
    True -> default
    False -> crt_sound
  }
}

pub fn convert(number: Int) -> String {
  let raindrop_by_3 = raindrop(_, number, 3, "Pling")
  let raindrop_by_5 = raindrop(_, number, 5, "Plang")
  let raindrop_by_7 = raindrop(_, number, 7, "Plong")
  let check_empty = default_on_empty(_, int.to_string(number))

  ""
  |> raindrop_by_3
  |> raindrop_by_5
  |> raindrop_by_7
  |> check_empty
}

pub fn main() {
  let res = convert(34)
  io.debug(res)
}
