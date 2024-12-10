import gleam/list
import gleam/string

const heart_template = "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     {{$1}}  +  {{$2}}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"

pub fn first_letter(name: String) {
  let first =
    name
    |> string.trim
    |> string.first

  case first {
    Ok(letter) -> letter
    _ -> ""
  }
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  heart_template
  |> string.replace(each: "{{$1}}", with: full_name1 |> initials)
  |> string.replace(each: "{{$2}}", with: full_name2 |> initials)
}
