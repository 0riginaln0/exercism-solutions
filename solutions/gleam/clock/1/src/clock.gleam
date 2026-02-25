import gleam/int

pub type Clock {
  Clock(hours: ClockHour, minutes: ClockMinute)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  case minute >= 0 {
    True -> Clock(new_ch(hour + minute / 60), new_cm(minute % 60))
    False -> {
      case minute % 60 {
        0 -> Clock(new_ch(hour + minute / 60), new_cm(minute % 60))
        _ -> Clock(new_ch(hour + minute / 60 - 1), new_cm(minute % 60))
      }
    }
  }
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hours.inner, clock.minutes.inner + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  echo clock
  echo create(clock.hours.inner, clock.minutes.inner - minutes)
}

pub fn display(clock: Clock) -> String {
  int.to_string(ch_to_int(clock.hours) / 10 % 10)
  <> int.to_string(ch_to_int(clock.hours) % 10)
  <> ":"
  <> int.to_string(cm_to_int(clock.minutes) / 10 % 10)
  <> int.to_string(cm_to_int(clock.minutes) % 10)
}

/// 0-23
pub opaque type ClockHour {
  ClockHour(inner: Int)
}

pub fn new_ch(i: Int) -> ClockHour {
  case i >= 0 {
    True -> ClockHour(i % 24)
    False -> ClockHour({ 24 - int.absolute_value(i) % 24 } % 24)
  }
}

pub fn ch_to_int(i: ClockHour) -> Int {
  i.inner
}

/// 0-59
pub opaque type ClockMinute {
  ClockMinute(inner: Int)
}

pub fn new_cm(i: Int) -> ClockMinute {
  case i >= 0 {
    True -> ClockMinute(i % 60)
    False -> ClockMinute({ 60 - int.absolute_value(i) % 60 } % 60)
  }
}

pub fn cm_to_int(i: ClockMinute) -> Int {
  i.inner
}
