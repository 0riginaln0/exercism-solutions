package circular_buffer

Buffer :: struct {
    data:       [dynamic]int,
    capacity:   int,
    length:     int,
    write_slot: int,
    read_slot:  int,
}

Error :: enum {
    None,
    BufferEmpty,
    BufferFull,
    Unimplemented,
}

new_buffer :: proc(capacity: int) -> Buffer {
    return Buffer {
        data = make([dynamic]int, capacity, capacity),
        capacity = capacity,
        length = 0,
        write_slot = 0,
        read_slot = 0,
    }
}

destroy_buffer :: proc(b: ^Buffer) {
    delete(b.data)
    clear(b)
}

clear :: proc(b: ^Buffer) {
    b.write_slot = 0
    b.read_slot = 0
    b.length = 0
}

read :: proc(b: ^Buffer) -> (int, Error) {
    if b.length == 0 do return 0, .BufferEmpty

    value := b.data[b.read_slot]
    advance(&b.read_slot, b)
    b.length -= 1

    return value, .None
}

write :: proc(b: ^Buffer, value: int) -> Error {
    if b.length == b.capacity do return .BufferFull

    b.data[b.write_slot] = value
    advance(&b.write_slot, b)
    b.length += 1

    return .None
}

overwrite :: proc(b: ^Buffer, value: int) {
    if write(b, value) == .BufferFull {
        b.data[b.write_slot] = value
        advance(&b.write_slot, b)
        advance(&b.read_slot, b)
    }
}

@(private)
advance :: proc(slot: ^int, b: ^Buffer) {
    slot^ = (slot^ + 1) % b.capacity
}
