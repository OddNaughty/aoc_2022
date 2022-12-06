defmodule AdventOfCode2022.Day3 do
  def part_1(rucksacks_list) do
    rucksacks_list
    |> String.split()
    |> Enum.map(fn string ->
      half_string_size = String.length(string) |> div(2)
      <<string_1::binary-size(half_string_size), string_2::binary>> = string
      [part1, part2] = for s <- [string_1, string_2], do: s |> String.codepoints() |> MapSet.new()

      MapSet.intersection(part1, part2)
      |> MapSet.to_list()
      |> List.first()
      |> then(fn
        <<v::utf8>> when v >= 97 -> v - 96
        <<v::utf8>> -> v - 38
      end)
    end)
    |> Enum.sum()
  end

  def part_2(rucksacks_list) do
    rucksacks_list
    |> String.split()
    |> Enum.chunk_every(3)
    |> Enum.map(fn strings ->
      [s1, s2, s3] =
        for string <- strings do
          string
          |> String.codepoints()
          |> MapSet.new()
        end

      MapSet.intersection(s1, s2)
      |> MapSet.intersection(s3)
      |> MapSet.to_list()
      |> List.first()
      |> then(fn
        <<v::utf8>> when v >= 97 -> v - 96
        <<v::utf8>> -> v - 38
      end)
    end)
    |> Enum.sum()
  end
end
