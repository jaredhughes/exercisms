defmodule BeerSong do
  def lyrics(range \\ 99..0) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  def verse(num) do
    """
    #{num} bottles of beer on the wall, #{num} bottles of beer.
    Take one down and pass it around, #{remaining(num)} of beer on the wall.
    """
  end

  defp remaining(num) when num >= 3, do: "#{num - 1} bottles"
  defp remaining(num) when num == 2, do: "1 bottle"
end
