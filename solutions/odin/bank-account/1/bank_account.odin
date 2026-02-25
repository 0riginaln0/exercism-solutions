package bank_account

import "core:sync"
import "core:math"

TransactionResult :: enum {
	Success,
	Account_Not_Open,
	Account_Already_Open,
	Invalid_Amount,
	Not_Enough_Balance,
	Unimplemented,
}

Account :: struct {
	transactions: [dynamic]int,
	opened: bool,
	mutex: sync.Mutex
}

open :: proc(self: ^Account) -> TransactionResult {
	if self.opened do return .Account_Already_Open
	self.opened = true
	return .Success
}

close :: proc(self: ^Account) -> TransactionResult {
	if !self.opened do return .Account_Not_Open
	self.opened = false
	clear(&self.transactions)
	return .Success
}

read_balance :: proc(self: ^Account) -> (u32, TransactionResult) {
	if !self.opened do return 0, .Account_Not_Open
	return u32(math.sum(self.transactions[:])), .Success
}

deposit :: proc(self: ^Account, amount: u32) -> TransactionResult {
	if amount == 0 do return .Invalid_Amount
	if !self.opened do return .Account_Not_Open
	do_transaction(self, int(amount))
	return .Unimplemented
}

withdraw :: proc(self: ^Account, amount: u32) -> TransactionResult {
	if amount == 0 do return .Invalid_Amount
	if !self.opened do return .Account_Not_Open
	balance := read_balance(self) or_return
	if balance < amount do return .Not_Enough_Balance
	do_transaction(self, -int(amount))
	return .Success
}

do_transaction :: proc(self: ^Account, amount: int) {
	sync.mutex_lock(&self.mutex)
	append_elem(&self.transactions, amount)
	sync.mutex_unlock(&self.mutex)
}