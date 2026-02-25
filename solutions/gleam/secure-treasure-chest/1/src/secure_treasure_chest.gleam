import gleam/string

pub opaque type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) {
    l if l >= 8 -> Ok(TreasureChest(password, contents))
    _ -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest {
    TreasureChest(password: p, treasure: t) if p == password -> Ok(t)
    _ -> Error("Incorrect password")
  }
}
