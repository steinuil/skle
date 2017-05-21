type ident = string

type expr =
    Proc of ident * ident list

type declaration =
    Def of ident * ident list * expr list
