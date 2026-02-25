import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(lc), Fahrenheit(f) -> {
      let rc = fahrenheit_to_celsius(f)
      float.compare(lc, rc)
    }
    Fahrenheit(lf), Celsius(rc) -> {
      let lc = fahrenheit_to_celsius(lf)
      float.compare(lc, rc)
    }
    Celsius(l), Celsius(r) | Fahrenheit(l), Fahrenheit(r) -> {
      float.compare(l, r)
    }
  }
}

fn compare_cities_by_temperature(left: City, right: City) -> Order {
  compare_temperature(left.temperature, right.temperature)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, compare_cities_by_temperature)
}
