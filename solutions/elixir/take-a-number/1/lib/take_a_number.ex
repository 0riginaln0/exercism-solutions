defmodule TakeANumber do
  defp machine_loop(state) do
    receive do
      {:report_state, sender} ->
        send(sender, state)
        machine_loop(state)

      {:take_a_number, sender} ->
        new_state = state + 1
        send(sender, new_state)
        machine_loop(new_state)

      :stop ->
        nil

      _ ->
        machine_loop(state)
    end
  end

  def start() do
    spawn(fn -> machine_loop(0) end)
  end
end
