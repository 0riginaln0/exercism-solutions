pub fn is_leap_year(year: Int) -> Bool {
  let rem400 = year % 400 == 0
  let rem100 = year % 100 == 0
  let rem4 = year % 4 == 0
  case year {
    y if rem400 -> True
    y if rem100 -> False
    y if rem4 -> True
    y -> False
  }
}
