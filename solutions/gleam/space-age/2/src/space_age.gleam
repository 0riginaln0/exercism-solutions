import gleam/float
import gleam/io
import gleam/list

pub type Planet {
  Mercury
  Venus
  Earth
  Mars
  Jupiter
  Saturn
  Uranus
  Neptune
}

// Get your age on a given planet from the earth seconds
pub fn age(planet: Planet, seconds: Float) -> Float {
  seconds
  /. case planet {
    Earth -> one_year_in_earth_seconds_on_earth
    Jupiter -> one_year_in_earth_seconds_on_jupiter
    Mars -> one_year_in_earth_seconds_on_mars
    Mercury -> one_year_in_earth_seconds_on_mercury
    Neptune -> one_year_in_earth_seconds_on_neptune
    Saturn -> one_year_in_earth_seconds_on_saturn
    Uranus -> one_year_in_earth_seconds_on_uranus
    Venus -> one_year_in_earth_seconds_on_venus
  }
}

const one_year_in_earth_seconds_on_mercury = 7_600_543.81992

const one_year_in_earth_seconds_on_venus = 19_414_149.052176

const one_year_in_earth_seconds_on_earth = 3.15576e7

const one_year_in_earth_seconds_on_mars = 59_354_032.690079994

const one_year_in_earth_seconds_on_jupiter = 374_355_659.124

const one_year_in_earth_seconds_on_saturn = 929_292_362.8848

const one_year_in_earth_seconds_on_uranus = 2_651_370_019.3296

const one_year_in_earth_seconds_on_neptune = 5_200_418_560.032001

fn one_year_in_seconds_on(planet: Planet) -> Float {
  let earth_year_seconds = 365.25 *. 24.0 *. 60.0 *. 60.0
  let orbital_period = case planet {
    Mercury -> 0.2408467
    Venus -> 0.61519726
    Earth -> 1.0
    Mars -> 1.8808158
    Jupiter -> 11.862615
    Saturn -> 29.447498
    Uranus -> 84.016846
    Neptune -> 164.79132
  }
  earth_year_seconds *. orbital_period
}

fn planet_to_string(planet: Planet) -> String {
  case planet {
    Earth -> "earth"
    Jupiter -> "jupiter"
    Mars -> "mars"
    Mercury -> "mercury"
    Neptune -> "neptune"
    Saturn -> "saturn"
    Uranus -> "uranus"
    Venus -> "venus"
  }
}

pub fn main() {
  [Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune]
  |> list.map(fn(planet) {
    "const one_year_in_earth_seconds_on_"
    <> planet_to_string(planet)
    <> " = "
    <> float.to_string(one_year_in_seconds_on(planet))
  })
  |> list.map(io.println)
}
