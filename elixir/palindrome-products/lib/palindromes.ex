defmodule Palindromes do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    min_factor..max_factor
    |> Enum.reduce(%{}, &make_palindrome_map/2)
  end

  defp make_palindrome_map(factor, acc) do
    {key, value} = find_palindromes(factor)

    Map.put(acc, key, value)
  end

  defp find_palindromes(factor) when factor <= 9 do
    palindromes =
      1..factor
      |> Enum.reduce([], fn divisor, acc ->
        factor
        |> divrem(divisor)
        |> case do
          value when not is_nil(value) -> [value] ++ acc
          _ -> acc
        end
        |> Enum.map(fn
          nil ->
            nil

          [a, a] ->
            [a, a]

          pair ->
            unless Enum.reverse(pair) in acc do
              pair
            end
        end)
      end)
      |> Enum.reject(&is_nil/1)

    {factor, palindromes}
  end

  defp divrem(num, divisor) do
    if whole_rem?(num / divisor) do
      [divisor, div(num, divisor)]
    end
  end

  defp whole_rem?(quotient) do
    quotient
    |> Float.to_string()
    |> Integer.parse()
    |> elem(1)
    |> String.split(".")
    |> Enum.at(1)
    |> String.to_integer() == 0
  end
end
