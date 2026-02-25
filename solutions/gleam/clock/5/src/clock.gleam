import gleam/int

pub type Clock {
  Clock(minutes: Int)
}

fn normalize_clock_minutes(minutes: Int) -> Int {
  // 24*60 + 60 = 1440
  { { minutes % 1440 } + 1440 } % 1440
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  hour * 60 + minute
  |> normalize_clock_minutes
  |> Clock
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  clock.minutes + minutes
  |> normalize_clock_minutes
  |> Clock
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  clock.minutes - minutes
  |> normalize_clock_minutes
  |> Clock
}

pub fn display(clock: Clock) -> String {
  let hour = clock.minutes / 60
  let min = clock.minutes % 60

  int.to_string(hour / 10 % 10)
  <> int.to_string(hour % 10)
  <> ":"
  <> int.to_string(min / 10 % 10)
  <> int.to_string(min % 10)
}
