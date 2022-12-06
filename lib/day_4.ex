defmodule AdventOfCode2022.Day4 do
  def part_1(section_assignments) do
    section_assignments
    |> String.split()
    |> Enum.map(fn d ->
      [[e1, e2], [e3, e4]] =
        for c <- String.split(d, ","),
            do: String.split(c, "-") |> Enum.map(&String.to_integer(&1))

      case {e1, e2, e3, e4} do
        {elf1_s, elf1_e, elf2_s, elf2_e} when elf1_s <= elf2_s and elf1_e >= elf2_e -> true
        {elf1_s, elf1_e, elf2_s, elf2_e} when elf2_s <= elf1_s and elf2_e >= elf1_e -> true
        _ -> false
      end
    end)
    |> Enum.filter(& &1)
    |> Enum.count()
  end

  def part_2(section_assignments) do
    section_assignments
    |> String.split()
    |> Enum.map(fn d ->
      parsed =
        for c <- String.split(d, ","),
            do: String.split(c, "-") |> Enum.map(&String.to_integer(&1))

      case parsed do
        [[elf1_s, elf1_e], [elf2_s, _elf2_e]] when elf1_e >= elf2_s and elf1_s <= elf2_s -> true
        [[elf1_s, _elf1_e], [elf2_s, elf2_e]] when elf2_e >= elf1_s and elf2_s <= elf1_s -> true
        _ -> false
      end
    end)
    |> Enum.filter(& &1)
    |> Enum.count()
  end
end
