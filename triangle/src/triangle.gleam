fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  let is_valid_sides = a >. 0.0 && b >. 0.0 && c >. 0.0
  let is_side_a = c +. b >=. a
  let is_side_b = a +. c >=. b
  let is_side_c = a +. b >=. c

  is_valid_sides && is_side_a && is_side_b && is_side_c
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && a == c && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && !scalene(a, b, c)
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a != b && a != c && b != c
}
// TODO
