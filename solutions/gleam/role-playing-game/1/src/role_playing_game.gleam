import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health == 0 {
    True ->
      case player.level >= 10 {
        True -> Some(Player(..player, health: 100, mana: Some(100)))
        False -> Some(Player(..player, health: 100))
      }
    False -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  // The cast_spell function takes as arguments an Int indicating how much mana the spell costs as well as a Player. 
  // It returns the updated player, as well as the amount of damage that the cast spell performs.

  case player.mana {
    // A successful spell cast does damage equal to two times the mana cost of the spell.
    Some(m)
      if m >= cost
    -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    // However, if the player has insufficient mana, nothing happens, the player is unchanged and no damage is done. 
    Some(_) -> #(player, 0)
    // If the player does not even have a mana pool,
    // attempting to cast the spell must decrease their health by the mana cost of the spell and does no damage. 
    None -> {
      #(decrease_health(player, cost), 0)
    }
  }
}

pub fn decrease_health(player: Player, damage: Int) -> Player {
  case player.health > damage {
    True -> Player(..player, health: player.health - damage)
    False -> Player(..player, health: 0)
  }
}
