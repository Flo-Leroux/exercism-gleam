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
  to_roman("", number)
}
