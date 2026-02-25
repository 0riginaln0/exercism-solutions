import gleam/list.{reverse}
import gleam/result.{try}

pub type Error {
  ImpossibleTarget
}

pub fn find_fewest_coins(
  coins: List(Int),
  target: Int,
) -> Result(List(Int), Error) {
  use _ <- try(target_is_not_negative(target))
  use coins <- try(we_have_change(coins))
  calculate_change(coins, target)
}

fn target_is_not_negative(target) {
  case target {
    t if t < 0 -> Error(ImpossibleTarget)
    _ -> Ok(Nil)
  }
}

fn we_have_change(coins: List(int)) {
  case list.length(coins) {
    0 -> Error(ImpossibleTarget)
    _ -> Ok(coins)
  }
}

fn calculate_change(coins, target) {
  do_calculate_change(coins, target, [])
}

fn do_calculate_change(coins, target, change) {
  case target {
    0 -> Ok(reverse(change))
    t -> {
      let coins_from_higher_to_lower = reverse(coins)
      let next_change_coin =
        list.find(coins_from_higher_to_lower, fn(coin) { coin <= target })
      case next_change_coin {
        Error(_) -> Error(ImpossibleTarget)
        Ok(change_coin) -> {
          do_calculate_change(
            coins,
            t - change_coin,
            list.append(change, [change_coin]),
          )
        }
      }
    }
  }
}
