package knapsack

Item :: struct {
    weight: u32,
    value:  u32,
}

maximum_value :: proc(maximum_weight: u32, items: []Item) -> u32 {
    // Array with indexes 0..=maximum_weight
    // It keeps the cumulative values that can be obtained by carrying the corresponding weight.
    v := make_dynamic_array_len([dynamic]u32, maximum_weight + 1)
    defer delete(v)

    for item in items {
        for weight := maximum_weight; weight >= item.weight; weight -= 1 {
            v[weight] = max(v[weight], v[weight - item.weight] + item.value)
        }
    }

    return v[maximum_weight]
}
