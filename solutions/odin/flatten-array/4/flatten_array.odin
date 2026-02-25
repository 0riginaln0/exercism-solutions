package flatten_array

Item :: union {
    i32,
    []Item,
}

flatten :: proc(input: Item) -> []i32 {
    items: [dynamic]i32
    stack: [dynamic]Item
    defer delete(stack)
    append(&stack, input)
    for len(stack) > 0 {
        box := pop(&stack)
        switch item in box {
        case i32:
            append(&items, item)
        case []Item:
            #reverse for i in item do append(&stack, i)
        }
    }
    return items[:]
}
