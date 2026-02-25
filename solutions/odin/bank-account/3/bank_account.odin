package bank_account

import "core:sync"

TransactionResult :: enum {
	Success,
	Account_Not_Open,
	Account_Already_Open,
	Invalid_Amount,
	Not_Enough_Balance,
}

Account :: struct {
	balance: int,
	opened: bool,
	mutex: sync.Mutex
}

open :: proc(self: ^Account) -> TransactionResult {
	sync.mutex_lock(&self.mutex)
	defer sync.mutex_unlock(&self.mutex)

	if self.opened do return .Account_Already_Open
	self.opened = true
	return .Success
}

close :: proc(self: ^Account) -> TransactionResult {
	sync.mutex_lock(&self.mutex)
	defer sync.mutex_unlock(&self.mutex)

	if !self.opened do return .Account_Not_Open
	self.opened = false
	self.balance = 0
	return .Success
}

read_balance :: proc(self: ^Account) -> (u32, TransactionResult) {
	sync.mutex_lock(&self.mutex)
	defer sync.mutex_unlock(&self.mutex)

	if !self.opened do return 0, .Account_Not_Open
	return u32(self.balance), .Success
}

deposit :: proc(self: ^Account, amount: u32) -> TransactionResult {
	sync.mutex_lock(&self.mutex)
	defer sync.mutex_unlock(&self.mutex)

	if amount == 0 do return .Invalid_Amount
	if !self.opened do return .Account_Not_Open
	self.balance += int(amount)
	return .Success
}

withdraw :: proc(self: ^Account, amount: u32) -> TransactionResult {
	sync.mutex_lock(&self.mutex)
	defer sync.mutex_unlock(&self.mutex)

	if amount == 0 do return .Invalid_Amount
	if !self.opened do return .Account_Not_Open
	if u32(self.balance) < amount do return .Not_Enough_Balance
	self.balance -= int(amount)
	return .Success
}
