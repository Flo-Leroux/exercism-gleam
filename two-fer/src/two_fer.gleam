import gleam/option.{type Option, None, Some}

fn say(name: String) -> String {
  "One for " <> name <> ", one for me."
}

pub fn two_fer(name: Option(String)) -> String {
  case name {
    Some(name) -> say(name)
    None -> say("you")
  }
}
