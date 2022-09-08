defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)

  @spec search(tuple, integer, integer, integer) :: {:ok, integer}
  def search({}, _, _, _), do: :not_found
  def search({key}, key, _, _), do: {:ok, 0}
  def search(numbers, key, _, high) when key > elem(numbers, high), do: :not_found
  def search(numbers, key, low, _) when key < elem(numbers, low), do: :not_found

  def search(numbers, key, low, high) do
    median_index = low + div(high - low, 2)
    current_value = elem(numbers, median_index)

    cond do
      current_value == key -> {:ok, median_index}
      key < current_value -> search(numbers, key, low, max(low, median_index - 1))
      key > current_value -> search(numbers, key, min(median_index + 1, high), high)
    end
  end
end
