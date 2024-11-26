fn to_roman(previous: String, next: Int) -> String {
  case next {
    _ if next - 1000 >= 0 -> to_roman(previous <> "M", next - 1000)
    _ if next - 900 >= 0 -> to_roman(previous <> "CM", next - 900)
    _ if next - 500 >= 0 -> to_roman(previous <> "D", next - 500)
    _ if next - 400 >= 0 -> to_roman(previous <> "CD", next - 400)
    _ if next - 100 >= 0 -> to_roman(previous <> "C", next - 100)
    _ if next - 90 >= 0 -> to_roman(previous <> "XC", next - 90)
    _ if next - 50 >= 0 -> to_roman(previous <> "L", next - 50)
    _ if next - 40 >= 0 -> to_roman(previous <> "XL", next - 40)
    _ if next - 10 >= 0 -> to_roman(previous <> "X", next - 10)
    _ if next - 9 >= 0 -> to_roman(previous <> "IX", next - 9)
    _ if next - 5 >= 0 -> to_roman(previous <> "V", next - 5)
    _ if next - 4 >= 0 -> to_roman(previous <> "IV", next - 4)
    _ if next - 1 >= 0 -> to_roman(previous <> "I", next - 1)
    _ -> previous
  }
}

pub fn convert(number: Int) -> String {
  case number {
    x if x - 1000 >= 0 -> "M" <> convert(x - 1000)
    x if x - 900 >= 0 -> "CM" <> convert(x - 900)
    x if x - 500 >= 0 -> "D" <> convert(x - 500)
    x if x - 400 >= 0 -> "CD" <> convert(x - 400)
    x if x - 100 >= 0 -> "C" <> convert(x - 100)
    x if x - 90 >= 0 -> "XC" <> convert(x - 90)
    x if x - 50 >= 0 -> "L" <> convert(x - 50)
    x if x - 40 >= 0 -> "XL" <> convert(x - 40)
    x if x - 10 >= 0 -> "X" <> convert(x - 10)
    x if x - 9 >= 0 -> "IX" <> convert(x - 9)
    x if x - 5 >= 0 -> "V" <> convert(x - 5)
    x if x - 4 >= 0 -> "IV" <> convert(x - 4)
    x if x - 1 >= 0 -> "I" <> convert(x - 1)
    _ -> ""
  }
}
