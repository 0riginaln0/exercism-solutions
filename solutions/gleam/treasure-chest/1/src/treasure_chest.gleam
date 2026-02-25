// Please define the TreasureChest generic custom type
pub type TreasureChest(a) {
  TreasureChest(password: String, teasure: a)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(pwd, tsr) if pwd == password -> Unlocked(tsr)
    _ -> WrongPassword
  }
}
