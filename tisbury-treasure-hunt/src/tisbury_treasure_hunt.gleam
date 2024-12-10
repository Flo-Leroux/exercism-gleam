import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(letter, number) = place_location
  #(number, letter)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let location = place_location_to_treasure_location(place.1)

  treasures
  |> list.map(fn(x) { x.1 })
  |> list.filter(fn(x) { x == location })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0 {
    "Brass Spyglass" -> place.0 == "Abandoned Lighthouse"
    "Amethyst Octopus" if place.0 == "Stormy Breakwater" ->
      case desired_treasure.0 {
        "Crystal Crab" | "Glass Starfish" -> True
        _ -> False
      }
    "Vintage Pirate Hat" if place.0 == "Harbor Managers Office" ->
      case desired_treasure.0 {
        "Model Ship in Large Bottle" | "Antique Glass Fishnet Float" -> True
        _ -> False
      }
    _ -> False
  }
}
