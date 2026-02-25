import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  treasure_location == place_location_to_treasure_location(place_location)
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  list.fold(treasures, 0, fn(counter, treasure) {
    case treasure_location_matches_place_location(place.1, treasure.1) {
      True -> counter + 1
      False -> counter
    }
  })
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let swap_possible = False

  // Certain treasures could be swapped for other certain treasure only in certain place
  let #(found_name, _) = found_treasure
  let #(desired_name, _) = desired_treasure
  let #(place_name, _) = place

  // "The Brass Spyglass can be swapped for any other treasure at the Abandoned Lighthouse"
  let found_brass_spyglass = found_name == "Brass spyglass"
  let abandoned_lighthouse = place_name == "Abandoned Lighthouse"
  let swap_possible =
    swap_possible || { found_brass_spyglass && abandoned_lighthouse }

  // The Amethyst Octopus can be swapped for the Crystal Crab or the Glass Starfish at the Stormy Breakwater.
  let found_amethyst_octopus = found_name == "Amethyst Octopus"
  let stormy_breakwater = place_name == "Stormy Breakwater"
  let desired_treasure_matches_reality = {
    desired_name == "Crystal Crab" || desired_name == "Glass Starfish"
  }
  let swap_possible =
    swap_possible
    || {
      found_amethyst_octopus
      && stormy_breakwater
      && desired_treasure_matches_reality
    }

  // The Vintage Pirate Hat can be swapped for the Model Ship in Large Bottle or the Antique Glass Fishnet Float at the Harbor Managers Office.
  let found_vintage_pirate_hat = found_name == "Vintage Pirate Hat"
  let harbor_managers_office = place_name == "Harbor Managers Office"
  let desired_treasure_matches_reality = {
    desired_name == "Model Ship in Large Bottle"
    || desired_name == "Antique Glass Fishnet Float"
  }

  let swap_possible =
    swap_possible
    || {
      found_vintage_pirate_hat
      && harbor_managers_office
      && desired_treasure_matches_reality
    }

  swap_possible
}
