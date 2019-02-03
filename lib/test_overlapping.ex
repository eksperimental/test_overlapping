defmodule Foo do

  @moduledoc """
  Documentation for TestOverlapping.
  """


  @spec ascii_printable?(list, 0) :: true
  @spec ascii_printable?([], limit) :: true
        when limit: :infinity | pos_integer
  @spec ascii_printable?([...], limit) :: boolean
        when limit: :infinity | pos_integer
  def ascii_printable?(list, limit \\ :infinity)
      when is_list(list) and (limit == :infinity or (is_integer(limit) and limit >= 0)) do
    ascii_printable_guarded?(list, limit)
  end

  defp ascii_printable_guarded?(_, 0) do
    true
  end

  defp ascii_printable_guarded?([char | rest], counter)
       # 7..13 is the range '\a\b\t\n\v\f\r'. 32..126 are ASCII printables.
       when is_integer(char) and
              ((char >= 7 and char <= 13) or char == ?\e or (char >= 32 and char <= 126)) do
    ascii_printable_guarded?(rest, decrement(counter))
  end

  defp ascii_printable_guarded?([], _counter), do: true
  defp ascii_printable_guarded?(_, _counter), do: false

  @compile {:inline, decrement: 1}
  defp decrement(:infinity), do: :infinity
  defp decrement(counter), do: counter - 1
end
