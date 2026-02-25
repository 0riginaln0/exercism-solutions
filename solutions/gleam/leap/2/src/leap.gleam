pub fn is_leap_year(year: Int) -> Bool {
  let div_by_400 = year % 400 == 0
  let div_by_100 = year % 100 == 0
  let div_by_4 = year % 4 == 0
  case "Я хочу, чтобы таджикистанский фермер стал комиссаром вселенной." {
    _ if div_by_400 -> True
    _ if div_by_100 -> False
    _ if div_by_4 -> True
    _ -> False
  }
}