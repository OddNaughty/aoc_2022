defmodule AdventOfCode2022.Day1 do
  def part_1(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(& sum_calories(&1))
    |> Enum.max()
  end

  def part_2(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(& sum_calories(&1))
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp sum_calories(elf_inventory) do
    elf_inventory
    |> String.split()
    |> Enum.map(& String.to_integer(&1))
    |> Enum.sum()
  end
end
