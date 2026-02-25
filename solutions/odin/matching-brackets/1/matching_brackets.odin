package matching_brackets

is_balanced :: proc(input: string) -> bool {
    brackets, braces, parentheses: int

    fifo := make_dynamic_array([dynamic]rune)
    defer delete(fifo)
    for ch in input {
        switch ch {
        case '[':
            append(&fifo, ch); brackets += 1
        case '{':
            append(&fifo, ch); braces += 1
        case '(':
            append(&fifo, ch); parentheses += 1
        case ']':
            if fi, found := pop_safe(&fifo); found && fi == '[' do brackets -= 1
            else do return false
        case '}':
            if fi, found := pop_safe(&fifo); found && fi == '{' do braces -= 1
            else do return false
        case ')':
            if fi, found := pop_safe(&fifo); found && fi == '(' do parentheses -= 1
            else do return false
        case:
            continue
        }
        if brackets < 0 || braces < 0 || parentheses < 0 do return false
    }

    return brackets == 0 && braces == 0 && parentheses == 0
}
