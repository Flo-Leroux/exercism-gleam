fn sum(n: Int) -> Int {
  case n {
    0 -> n
    _ -> n + sum(n - 1)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let to_square = sum(n)
  to_square * to_square
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> n
    _ -> n * n + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
