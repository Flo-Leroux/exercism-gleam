import gleam/option.{type Option}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    option.Some(name) -> name
    option.None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 ->
      option.Some(
        Player(
          ..player,
          health: 100,
          mana: case player.level >= 10 {
            True -> option.Some(100)
            False -> option.None
          },
        ),
      )
    _ -> option.None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    option.Some(mana) ->
      case mana > cost {
        True -> #(Player(..player, mana: option.Some(mana - cost)), cost * 2)
        False -> #(player, 0)
      }
    option.None -> #(
      Player(
        ..player,
        health: {
          case player.health - cost {
            new_health if new_health > 0 -> new_health
            _ -> 0
          }
        },
      ),
      0,
    )
  }
}
