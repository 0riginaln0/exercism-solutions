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

fn one_year_in_seconds_on(planet: Planet) -> Float {
  case planet {
    Earth -> {
      365.25 *. 24.0 *. 60.0 *. 60.0
    }
    Jupiter -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 11.862615
    }
    Mars -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 1.8808158
    }
    Mercury -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 0.2408467
    }
    Neptune -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 164.79132
    }
    Saturn -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 29.447498
    }
    Uranus -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 84.016846
    }
    Venus -> {
      365.25 *. 24.0 *. 60.0 *. 60.0 *. 0.61519726
    }
  }
}

pub fn age(planet: Planet, seconds: Float) -> Float {
  seconds /. one_year_in_seconds_on(planet)
}
