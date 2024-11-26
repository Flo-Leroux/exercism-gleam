pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(to_add: Int) -> Int { to_add + secret }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(to_substract: Int) -> Int { to_substract - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(to_multiply: Int) -> Int { to_multiply * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn(to_divide: Int) -> Int { to_divide / secret }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  fn(to_combine: Int) -> Int {
    to_combine
    |> secret_function1
    |> secret_function2
  }
}
