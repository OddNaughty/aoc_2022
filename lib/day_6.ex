defmodule AdventOfCode2022.Day6 do
  defguard all_different(a, b, c, d)
           when a != b and a != c and a != d and
                  b != c and b != d and
                  c != d

  def part_1(input), do: part_1(input, 0)

  def part_1(<<a::utf8, b::utf8, c::utf8, d::utf8, _::binary>>, pos)
      when all_different(a, b, c, d),
      do: pos + 4

  def part_1(<<_::utf8, rest::binary>>, pos), do: part_1(rest, pos + 1)

  def part_2(input), do: part_2(input, 0)

  def part_2(<<s::binary-size(14), _::binary>> = input, pos) do
    <<_::utf8, rest::binary>> = input
    single_chars = to_charlist(s) |> Enum.uniq()

    if length(single_chars) == 14 do
      pos + 14
    else
      part_2(rest, pos + 1)
    end
  end
end
