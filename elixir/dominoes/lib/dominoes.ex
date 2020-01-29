defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino] | []) :: boolean
  def chain?([]), do: true

  def chain?([{a, b}]), do: a == b

  def chain?(dominoes) do
    IO.inspect("\n\n\n")
    IO.inspect("-------------")

    # left = Enum.map(dominoes, fn {l, _} -> l end)
    # right = Enum.map(dominoes, fn {_, r} -> r end)

    dominoes
    |> IO.inspect()
    |> Enum.reduce(%{}, fn {a, b}, acc ->
      if a != b do
        Map.update(acc, a, 1, &(&1 + 1))
        |> Map.update(b, 1, &(&1 + 1))
      else
        Map.update(acc, a, 1, &(&1 + 1))
      end
    end)
    |> IO.inspect()
    |> Enum.all?(fn {_, v} ->
      rem(v, 2) == 0
    end)
  end
end
