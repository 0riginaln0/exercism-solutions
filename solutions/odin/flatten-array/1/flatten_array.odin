package flatten_array

Item :: union {
    i32,
    []Item,
}

flatten :: proc(input: Item) -> []i32 {
    items: [dynamic]i32
    do_flatten(&items, input)
    return items[:]
}

do_flatten :: proc(acc: ^[dynamic]i32, next_item: Item) {
    switch item in next_item {
    case i32:
        append_elem(acc, item)
    case []Item:
        for i in item do do_flatten(acc, i)
    }
}
