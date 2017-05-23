type ident = string
type type_ = string

type expr =
| Call of ident * ident list

type declaration = (ident * type_) * (ident * type_) list * expr list
