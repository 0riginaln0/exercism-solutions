defmodule LogLevel do
  def to_label(level, legacy?) do
    case {level, legacy?} do
      {0, true} -> :unknown
      {0, false} -> :trace
      {1, true} -> :debug
      {1, false} -> :debug
      {2, true} -> :info
      {2, false} -> :info
      {3, true} -> :warning
      {3, false} -> :warning
      {4, true} -> :error
      {4, false} -> :error
      {5, true} -> :unknown
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  def determine_recipient(:error, _), do: :ops
  def determine_recipient(:fatal, _), do: :ops
  def determine_recipient(:unknown, true), do: :dev1
  def determine_recipient(:unknown, _), do: :dev2
  def determine_recipient(_, _), do: false

  def alert_recipient(level, legacy?) do
    log_label = to_label(level, legacy?)
    determine_recipient(log_label, legacy?)
  end
end
