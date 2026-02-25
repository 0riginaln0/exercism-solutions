// Inspired by this video https://youtu.be/KnWorqyDSLA?si=vNR2d5GRzafuaJOk
import gleam/bool
import gleam/dict.{type Dict}
import gleam/int
import gleam/list.{filter, first, fold, length, range, repeat, reverse}

pub type Error {
  ImpossibleTarget
}

type Entry {
  Entry(coins_number: Int, change: List(Int))
  UndefinedEntry
}

fn new_array(range: List(Int)) -> Dict(Int, Entry) {
  fold(over: range, from: dict.new(), with: fn(dict_array, slot) {
    case slot {
      0 -> dict.insert(dict_array, slot, Entry(0, []))
      _ -> dict.insert(dict_array, slot, UndefinedEntry)
    }
  })
}

pub fn find_fewest_coins(
  coins: List(Int),
  target: Int,
) -> Result(List(Int), Error) {
  use <- bool.guard(target == 0, Ok([]))
  use <- bool.guard(target < 0, Error(ImpossibleTarget))

  let coins_length = length(coins)
  use <- bool.guard(coins_length <= 0, Error(ImpossibleTarget))

  let assert Ok(smallest_coin) = first(coins)
  use <- bool.guard(smallest_coin > target, Error(ImpossibleTarget))

  let processed_array = {
    let valid_coins = filter(coins, fn(coin) { coin <= target })
    let array = new_array(range(0, target))
    process_array(valid_coins, array, target)
  }

  let assert Ok(slot) = dict.get(processed_array, target)
  case slot {
    Entry(_, change) -> Ok(reverse(change))
    UndefinedEntry -> Error(ImpossibleTarget)
  }
}

fn process_array(
  coins: List(Int),
  array: Dict(Int, Entry),
  target: Int,
) -> Dict(Int, Entry) {
  use array, coin <- fold(over: coins, from: array)
  use array, index <- fold(over: range(coin, target), from: array)

  let assert Ok(slot) = dict.get(array, index)
  case slot {
    UndefinedEntry -> {
      let assert Ok(rem) = int.remainder(index, coin)
      case rem {
        0 -> {
          let coins_number = index / coin
          dict.insert(
            array,
            index,
            Entry(coins_number, repeat(coin, coins_number)),
          )
        }
        _ -> {
          let assert Ok(shifted_slot) = dict.get(array, index - coin)
          case shifted_slot {
            Entry(prev_coins_number, prev_change) -> {
              let new_coins_number = prev_coins_number + 1
              dict.insert(
                array,
                index,
                Entry(new_coins_number, [coin, ..prev_change]),
              )
            }
            UndefinedEntry -> array
          }
        }
      }
    }
    Entry(coins_number, _) -> {
      let assert Ok(shifted_slot) = dict.get(array, index - coin)
      case shifted_slot {
        Entry(prev_coins_number, prev_change) -> {
          let new_coins_number = prev_coins_number + 1
          case coins_number > new_coins_number {
            True ->
              dict.insert(
                array,
                index,
                Entry(new_coins_number, [coin, ..prev_change]),
              )
            False -> array
          }
        }
        UndefinedEntry -> array
      }
    }
  }
}
