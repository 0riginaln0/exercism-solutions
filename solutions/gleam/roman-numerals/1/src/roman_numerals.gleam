pub fn convert(number: Int) -> String {
  let ones = number % 10
  let tens = { number / 10 } % 10
  let hundreds = { number / 100 } % 10
  let thousands = { number / 1000 } % 10

  ""
  <> case thousands {
    n if n == 1 -> "M"
    n if n == 2 -> "MM"
    n if n == 3 -> "MMM"
    _ -> ""
  }
  <> case hundreds {
    n if n == 1 -> "C"
    n if n == 2 -> "CC"
    n if n == 3 -> "CCC"
    n if n == 4 -> "CD"
    n if n == 5 -> "D"
    n if n == 6 -> "DC"
    n if n == 7 -> "DCC"
    n if n == 8 -> "DCCC"
    n if n == 9 -> "CM"
    _ -> ""
  }
  <> case tens {
    n if n == 1 -> "X"
    n if n == 2 -> "XX"
    n if n == 3 -> "XXX"
    n if n == 4 -> "XL"
    n if n == 5 -> "L"
    n if n == 6 -> "LX"
    n if n == 7 -> "LXX"
    n if n == 8 -> "LXXX"
    n if n == 9 -> "XC"
    _ -> ""
  }
  <> case ones {
    n if n == 1 -> "I"
    n if n == 2 -> "II"
    n if n == 3 -> "III"
    n if n == 4 -> "IV"
    n if n == 5 -> "V"
    n if n == 6 -> "VI"
    n if n == 7 -> "VII"
    n if n == 8 -> "VIII"
    n if n == 9 -> "IX"
    _ -> ""
  }
}
