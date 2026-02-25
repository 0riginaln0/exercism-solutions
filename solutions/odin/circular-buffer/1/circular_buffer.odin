package circular_buffer

import "core:fmt"

// Complete the Buffer data structure.
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
}

clear :: proc(b: ^Buffer) {
    b.write_slot = 0
    b.read_slot = 0
    b.length = 0
}

read :: proc(b: ^Buffer) -> (int, Error) {
    if b.length == 0 do return 0, .BufferEmpty

    value := b.data[b.read_slot]
    b.read_slot = (b.read_slot + 1) % b.capacity
    b.length = b.length - 1

    return value, .None
}

write :: proc(b: ^Buffer, value: int) -> Error {
    if b.length == b.capacity do return .BufferFull

    b.data[b.write_slot] = value
    b.write_slot = (b.write_slot + 1) % b.capacity
    b.length = b.length + 1

    return .None
}

overwrite :: proc(b: ^Buffer, value: int) {
    if write(b, value) == .BufferFull {
        b.data[b.write_slot] = value
        b.write_slot = (b.write_slot + 1) % b.capacity
        b.read_slot = (b.read_slot + 1) % b.capacity
    }
}
