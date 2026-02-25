import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  calculate_pizza_price(pizza, 0)
}

pub fn calculate_pizza_price(pizza: Pizza, accumulator: Int) -> Int {
  case pizza {
    Margherita -> 7 + accumulator
    Caprese -> 9 + accumulator
    Formaggio -> 10 + accumulator
    ExtraSauce(with) -> calculate_pizza_price(with, accumulator + 1)
    ExtraToppings(with) -> calculate_pizza_price(with, accumulator + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let price =
    list.fold(from: 0, over: order, with: fn(acc, pizza) {
      acc + pizza_price(pizza)
    })
  let fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  price + fee
}
