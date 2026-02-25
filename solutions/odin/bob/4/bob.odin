package bob

import "core:strings"
import "core:unicode"

is_blank :: proc(s: string) -> bool {
	if len(s) == 0 do return true
	for r in s do if !unicode.is_white_space(r) do return false
	return true
}

contains_letter :: proc(s: string) -> bool {
	for r in s do if unicode.is_letter(r) do return true
	return false
}

is_upper_cased :: proc(s: string) -> bool {
	defer free_all(context.temp_allocator)
	return s == strings.to_upper(s, context.temp_allocator)
}

ends_with_question :: proc(s: string) -> bool {
	l := len(s)
	if l == 0 do return false
	return '?' == s[l - 1]
}

does :: proc(sentense: string, requirements: []#type proc(string) -> bool) -> bool {
	c := 0
	for requirement in requirements do if requirement(sentense) do c += 1
	return c == len(requirements)
}

response :: proc(input: string) -> string {
	sentence := strings.trim_space(input)

	switch {
	case does(sentence, {contains_letter, is_upper_cased, ends_with_question}):
		return "Calm down, I know what I'm doing!"
	case does(sentence, {contains_letter, is_upper_cased}):
		return "Whoa, chill out!"
	case does(sentence, {ends_with_question}):
		return "Sure."
	case does(sentence, {is_blank}):
		return "Fine. Be that way!"
	case:
		return "Whatever."
	}	
}
