defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> %{plots: %{}, last_plot_id: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> Map.values(plots) end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, last_plot_id: last_plot_id} ->
      new_plot_id = last_plot_id + 1
      new_plot = %Plot{plot_id: new_plot_id, registered_to: register_to}
      {new_plot, %{plots: Map.put(plots, new_plot_id, new_plot), last_plot_id: new_plot_id}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{plots: plots} = registry ->
      %{registry | plots: Map.delete(plots, plot_id)}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      Map.get(plots, plot_id, {:not_found, "plot is unregistered"})
    end)
  end
end
