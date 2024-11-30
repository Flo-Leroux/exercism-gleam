import gleam/int
import gleam/io
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(0, limit - 1)
  |> list.filter(fn(n) { list.any(factors, fn(f) { f > 0 && n % f == 0 }) })
  |> int.sum
}

pub fn main() {
  let rest = sum([3], 20)
  io.debug(rest)
}
