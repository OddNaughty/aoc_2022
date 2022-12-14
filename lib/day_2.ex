defmodule AdventOfCode2022.Day2 do
  def part_1(strategy_guide_book) do
    strategy_guide_book
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(&get_score(&1))
    |> Enum.sum()
  end

  def part_2(strategy_guide_book) do
    strategy_guide_book
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(&get_score_part_2(&1))
    |> Enum.sum()
  end

  defp get_score(strategy_guide_line) do
    case strategy_guide_line do
      ["A", "X"] -> 1 + 3
      ["A", "Y"] -> 2 + 6
      ["A", "Z"] -> 3 + 0
      ["B", "X"] -> 1 + 0
      ["B", "Y"] -> 2 + 3
      ["B", "Z"] -> 3 + 6
      ["C", "X"] -> 1 + 6
      ["C", "Y"] -> 2 + 0
      ["C", "Z"] -> 3 + 3
    end
  end

  defp get_score_part_2(strategy_guide_line) do
    case strategy_guide_line do
      ["A", "X"] -> 0 + 3
      ["A", "Y"] -> 3 + 1
      ["A", "Z"] -> 6 + 2
      ["B", "X"] -> 0 + 1
      ["B", "Y"] -> 3 + 2
      ["B", "Z"] -> 6 + 3
      ["C", "X"] -> 0 + 2
      ["C", "Y"] -> 3 + 3
      ["C", "Z"] -> 6 + 1
    end
  end
end
