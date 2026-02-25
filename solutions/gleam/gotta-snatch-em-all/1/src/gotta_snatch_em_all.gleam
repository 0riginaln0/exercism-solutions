import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, set.insert(collection, card))
  }
}

fn make_trade(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> Set(String) {
  let #(_, new_collection) =
    collection
    |> set.delete(my_card)
    |> add_card(their_card)
  new_collection
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let card_to_give_presents = set.contains(collection, my_card)
  let card_to_take_presents = set.contains(collection, their_card)

  case card_to_give_presents, card_to_take_presents {
    False, _ | _, True -> #(False, make_trade(my_card, their_card, collection))
    True, False -> #(True, make_trade(my_card, their_card, collection))
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case list.reduce(collections, set.intersection) {
    Ok(most_common_cards) -> set.to_list(most_common_cards)
    Error(_) -> []
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case
    collections
    |> list.reduce(set.union)
    |> result.map(set.size)
  {
    Ok(total) -> total
    Error(_) -> 0
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) { string.starts_with(card, "Shiny ") })
}
