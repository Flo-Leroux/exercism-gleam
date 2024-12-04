import gleam/list
import gleam/string

type Template {
  Template(text: List(String), stack: List(String), valid: Bool)
}

fn new_template(text text: String) -> Template {
  Template(text: string.to_graphemes(text), stack: [], valid: True)
}

fn push(
  tpl tpl: Template,
  char char: String,
  next next: List(String),
) -> Template {
  run(Template(..tpl, text: next, stack: [char, ..tpl.stack]))
}

fn check(
  tpl tpl: Template,
  char char: String,
  next next: List(String),
) -> Template {
  let updated = {
    case list.is_empty(tpl.stack) {
      True -> Template(..tpl, valid: False)
      False -> tpl
    }
  }

  let updated = {
    case updated.stack {
      [first, ..rest] -> {
        case first {
          "(" if char == ")" -> Template(..updated, text: next, stack: rest)
          "{" if char == "}" -> Template(..updated, text: next, stack: rest)
          "[" if char == "]" -> Template(..updated, text: next, stack: rest)
          _ -> Template(..updated, valid: False)
        }
      }
      _ -> updated
    }
  }

  case updated.valid {
    False -> run(Template(..updated, text: []))
    True -> run(updated)
  }
}

fn eat(tpl tpl: Template, next next: List(String)) -> Template {
  run(Template(..tpl, text: next))
}

fn run(tpl tpl: Template) -> Template {
  case tpl.text {
    [char, ..rest] -> {
      case char {
        "{" | "(" | "[" -> push(tpl, char, rest)
        "}" | ")" | "]" -> check(tpl, char, rest)
        _ -> eat(tpl, rest)
      }
    }
    _ -> tpl
  }
}

fn is_valid(tpl tpl: Template) -> Bool {
  tpl.valid && list.is_empty(tpl.stack) && list.is_empty(tpl.text)
}

pub fn is_paired(value: String) -> Bool {
  new_template(value)
  |> run
  |> is_valid
}
