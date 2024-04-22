defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and legacy? -> :unknown
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and legacy? -> :unknown
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  @spec alert_recipient(any(), any()) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) in [:error, :fatal] -> :ops
      to_label(level, legacy?) == :unknown and legacy? -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end
