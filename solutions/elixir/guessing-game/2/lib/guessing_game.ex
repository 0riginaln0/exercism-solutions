defmodule GuessingGame do
  def compare(secret_number, guess) when is_number(guess) and secret_number == guess,
    do: "Correct"

  def compare(secret_number, guess)
      when is_number(guess) and (guess - 1 == secret_number or guess + 1 == secret_number),
      do: "So close"

  def compare(secret_number, guess) when is_number(guess) and guess < secret_number, do: "Too low"

  def compare(secret_number, guess) when is_number(guess) and guess > secret_number,
    do: "Too high"

  def compare(_, _ \\ :no_guess), do: "Make a guess"
end
