defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([head | tail]) do
    tail
    |> do_flatten(do_flatten(head, []))
  end

  defp do_flatten([head | tail], acc) when is_list(head) do
    tail
    |> do_flatten(acc ++ flatten(head))
  end

  defp do_flatten([head | tail], acc) do
    tail
    |> do_flatten(do_flatten(head, acc))
  end

  defp do_flatten(nil, acc), do: acc
  defp do_flatten([], acc), do: acc
  defp do_flatten(value, acc), do: acc ++ [value]
end
