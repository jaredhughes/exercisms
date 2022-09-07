defmodule RomanNumerals do
  defp subtract(initial, amount), do: initial - amount

  def build_numeral(number, numeral) when number >= 1000 do
    number
    |> subtract(1000)
    |> build_numeral("#{numeral}M")
  end

  def build_numeral(number, numeral) when number >= 900 do
    number
    |> subtract(900)
    |> build_numeral("#{numeral}CM")
  end

  def build_numeral(number, numeral) when number >= 500 do
    number
    |> subtract(500)
    |> build_numeral("#{numeral}D")
  end

  def build_numeral(number, numeral) when number >= 400 do
    number
    |> subtract(400)
    |> build_numeral("#{numeral}CD")
  end

  def build_numeral(number, numeral) when number >= 100 do
    number
    |> subtract(100)
    |> build_numeral("#{numeral}C")
  end

  def build_numeral(number, numeral) when number >= 90 do
    number
    |> subtract(90)
    |> build_numeral("#{numeral}XC")
  end

  def build_numeral(number, numeral) when number >= 50 do
    number
    |> subtract(50)
    |> build_numeral("#{numeral}L")
  end

  def build_numeral(number, numeral) when number >= 40 do
    number
    |> subtract(40)
    |> build_numeral("#{numeral}XL")
  end

  def build_numeral(number, numeral) when number >= 10 do
    number
    |> subtract(10)
    |> build_numeral("#{numeral}X")
  end

  def build_numeral(9, numeral), do: build_numeral(0, "#{numeral}IX")

  def build_numeral(number, numeral) when number >= 5 do
    number
    |> subtract(5)
    |> build_numeral("#{numeral}V")
  end

  def build_numeral(4, numeral), do: build_numeral(0, "#{numeral}IV")

  def build_numeral(number, numeral) when number >= 1 do
    number
    |> subtract(1)
    |> build_numeral("#{numeral}I")
  end

  def build_numeral(0, numeral), do: numeral

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> build_numeral("")
  end
end
