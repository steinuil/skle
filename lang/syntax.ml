type ident = string

type expr =
    Proc of ident * ident list

type declaration =
    Def of ident * expr list
