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
  |> list.map(fn(name) { initial(name) })
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  //      ******       ******
  //    **      **   **      **
  //  **         ** **         **
  // **            *            **
  // **                         **
  // **     X. X.  +  X. X.     **
  //  **                       **
  //    **                   **
  //      **               **
  //        **           **
  //          **       **
  //            **   **
  //              ***
  //               *
  let initials_1 = full_name1 |> initials
  let initials_2 = full_name2 |> initials

  heart_template
  |> string.replace(each: "{{$1}}", with: initials_1)
  |> string.replace(each: "{{$2}}", with: initials_2)
}
