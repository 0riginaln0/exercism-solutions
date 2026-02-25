package robotname

import "core:fmt"
import "core:math/rand"

Robot_Storage :: struct {
	names: [dynamic]string,
	index: int,
}

Robot :: struct {
	name: string,
}

Error :: enum {
	Could_Not_Create_Name,
	Unimplemented,
}

MAX_ROBOT_NAMES :: 26 * 26 * 10 * 10 * 10

make_storage :: proc() -> Robot_Storage {
	storage := Robot_Storage {
		names = make([dynamic]string, 0, MAX_ROBOT_NAMES),
		index = 0,
	}
	for i in 0 ..= 999 {
		for a in 'A' ..= 'Z' {
			for b in 'A' ..= 'Z' {
				name := fmt.aprintf("%c%c%03d", a, b, i)
				append_elem(&storage.names, name)
			}
		}
	}
	rand.shuffle(storage.names[:])
	return storage
}

delete_storage :: proc(storage: ^Robot_Storage) {
	for name in storage.names {
		delete(name)
	}
	delete(storage.names)
}

new_robot :: proc(storage: ^Robot_Storage) -> (Robot, Error) {
	if storage.index >= len(storage.names) {
		return Robot{}, .Could_Not_Create_Name
	}

	name := storage.names[storage.index]
	storage.index += 1

	return Robot{name = name}, nil
}


reset :: proc(storage: ^Robot_Storage, r: ^Robot) {
	if storage.index >= len(storage.names) {
		return
	}
	r.name = storage.names[storage.index]
	storage.index += 1
}
