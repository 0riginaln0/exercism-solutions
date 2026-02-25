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
  // Certain treasures could be swapped for other certain treasure only in certain place
  let #(found_name, _) = found_treasure
  let #(place_name, _) = place
  let #(desired_name, _) = desired_treasure

  case found_name {
    // The Brass Spyglass can be swapped for any other treasure at the Abandoned Lighthouse.
    "Brass Spyglass" ->
      case place_name {
        "Abandoned Lighthouse" -> True
        _ -> False
      }
    // The Amethyst Octopus can be swapped for the Crystal Crab or the Glass Starfish at the Stormy Breakwater.
    "Amethyst Octopus" ->
      case place_name {
        "Stormy Breakwater" ->
          case desired_name {
            "Crystal Crab" | "Glass Starfish" -> True
            _ -> False
          }
        _ -> False
      }
    // The Vintage Pirate Hat can be swapped for the Model Ship in Large Bottle or the Antique Glass Fishnet Float at the Harbor Managers Office.
    "Vintage Pirate Hat" ->
      case place_name {
        "Harbor Managers Office" ->
          case desired_name {
            "Model Ship in Large Bottle" | "Antique Glass Fishnet Float" -> True
            _ -> False
          }
        _ -> False
      }
    _ -> False
  }
}
