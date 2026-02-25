import gleam/list
import gleam/result

pub fn today(days: List(Int)) -> Int {
  days
  |> list.first()
  |> result.unwrap(0)
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> [today + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  days
  |> list.contains(0)
}

pub fn total(days: List(Int)) -> Int {
  list.fold(over: days, from: 0, with: fn(accum, birds_number) {
    accum + birds_number
  })
}

pub fn busy_days(days: List(Int)) -> Int {
  list.fold(over: days, from: 0, with: fn(busy_days, birds_number) {
    case birds_number >= 5 {
      True -> busy_days + 1
      False -> busy_days
    }
  })
}
