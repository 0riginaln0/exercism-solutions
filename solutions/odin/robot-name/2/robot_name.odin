package robotname

import "core:fmt"
import "core:math/rand"
import "core:strings"

Robot :: struct {
	name: string,
}

Error :: enum {
	Could_Not_Create_Name,
}

Robot_Storage :: struct {
	names: Names,
	count: int,
}
Names :: map[string]bool

make_storage :: proc() -> (rs: Robot_Storage) {
	rs.names = make_map(Names)
	return
}

delete_storage :: proc(storage: ^Robot_Storage) {
	delete_map(storage.names)
}

reset :: proc(storage: ^Robot_Storage, r: ^Robot) {
	delete_key(&storage.names, r.name)
	nr, _ := new_robot(storage)
	r.name = nr.name
}

MAX_POSSIBLE_NAMES_COUNT :: 26 * 26 * 10 * 10 * 10
Name_Builder :: [5]u8

new_robot :: proc(storage: ^Robot_Storage) -> (Robot, Error) {
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)
	name, name_builder := create_new_name(&sb)
	if (name in storage.names) {
		if storage.count == MAX_POSSIBLE_NAMES_COUNT do return {}, .Could_Not_Create_Name
		for (name in storage.names) {
			increment_name_builder(&name_builder)
			name = to_string(&sb, name_builder)
		}
	}
	storage.names[name] = true
	return Robot{name = name}, nil
}

@(private)
create_new_name :: proc(sb: ^strings.Builder) -> (string, Name_Builder) {
	nb := Name_Builder {
		random_uppercase_letter(),
		random_uppercase_letter(),
		random_digit(),
		random_digit(),
		random_digit(),
	}
	return to_string(sb, nb), nb
}

@(private)
random_uppercase_letter :: proc() -> u8 {
	return u8(rand.int_range('A', 'Z' + 1))
}

@(private)
random_digit :: proc() -> u8 {
	return u8(rand.uint32_range(0, 10))
}

@(private)
to_string :: proc(sb: ^strings.Builder, name_builder: Name_Builder) -> string {
	return fmt.sbprintf(
		sb,
		"%c%c%d%d%d",
		name_builder[0],
		name_builder[1],
		name_builder[2],
		name_builder[3],
		name_builder[4],
	)
}


@(private)
increment_name_builder :: proc(name: ^Name_Builder) {
	// ZZ999 -> AA000
	if equals(name^, {'Z', 'Z', 9, 9, 9}) do name^ = {'A', 'A', 0, 0, 0}

	// __123 -> __124
	digits_part: u16 = u16(name[2] * 100) + u16(name[3] * 10) + u16(name[4])
	if digits_part != 999 {
		digits_part += 1
		name[2] = u8(digits_part / 100 % 1)
		name[3] = u8(digits_part / 10 % 1)
		name[4] = u8(digits_part % 1)
		return
	}

	// _A999 -> _B000
	if name[1] < 'Z' {
		name[1] += 1
		name[2] = 0
		name[3] = 0
		name[4] = 0
		return
	}

	// AZ999 -> BA000
	name[0] += 1
	name[1] = 'A'
	name[2] = 0
	name[3] = 0
	name[4] = 0
	return
}

@(private)
equals :: proc(name1, name2: Name_Builder) -> bool {
	for c, i in name1 do if name2[i] != c do return false
	return true
}
