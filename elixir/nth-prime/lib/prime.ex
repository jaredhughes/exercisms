defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when is_integer(count) and count > 0 do
    0..count
    |> Enum.reduce_while(0, fn num, acc ->
      if num == count and is_prime?(acc) do
        {:halt, acc}
      else
        continue(acc + 1)
      end
    end)
  end

  def nth(_), do: raise("Invalid input")

  defp continue(num) do
    if is_prime?(num) do
      {:cont, num}
    else
      {:cont, next_prime(num)}
    end
  end

  defp next_prime(num) do
    if is_prime?(num) do
      num
    else
      next_prime(num + 1)
    end
  end

  defp is_prime?(num) when num >= 2 do
    2..num
    |> Enum.filter(fn n ->
      rem(num, n) == 0
    end)
    |> length == 1
  end

  defp is_prime?(_), do: false
end
