defmodule AdventOfCode2022.Day5 do
  def part_1(stacks_input) do
    %{stacks: stacks, instructions: instructions} = parse(stacks_input)

    Enum.reduce(instructions, stacks, fn %{from: from, to: to, nb: count}, stacks ->
      Enum.reduce(1..count, stacks, fn
        _, %{^from => [head_from | tail_from], ^to => to_stack} = acc ->
          %{
            acc
            | from => tail_from,
              to => [head_from | to_stack]
          }
      end)
    end)
    |> Enum.reduce([], fn {_k, [first_letter | _]}, acc -> [first_letter | acc] end)
    |> Enum.reverse()
  end

  def part_2(stacks_input) do
    %{stacks: stacks, instructions: instructions} = parse(stacks_input)

    Enum.reduce(instructions, stacks, fn %{from: from, to: to, nb: count}, stacks ->
      to_stack = Enum.take(stacks[from], count) ++ stacks[to]
      from_stack = Enum.drop(stacks[from], count)
      %{
        stacks |
        from => from_stack,
        to => to_stack
      }
    end)
    |> Enum.reduce([], fn {_k, [first_letter | _]}, acc -> [first_letter | acc] end)
    |> Enum.reverse()
  end

  defp parse(s), do: parse(s, 1, %{})
  # New line, reset stack number
  defp parse(<<?\n::utf8, rest::binary>>, _stack_number, stacks),
    do: parse(rest, 1, stacks)

  # Matching an empty stack
  defp parse(<<?\s::utf8, ?\s::utf8, ?\s::utf8, rest::binary>>, stack_number, stacks) do
    parse(rest, stack_number, stacks)
  end

  # Matching a stack
  defp parse(<<?[::utf8, box::utf8, ?]::utf8, rest::binary>>, stack_number, stacks) do
    stacks =
      Map.update(stacks, Integer.to_string(stack_number), [box], fn boxes -> [box | boxes] end)

    parse(rest, stack_number, stacks)
  end

  # Stack separator
  defp parse(<<?\s::utf8, rest::binary>>, stack_number, stacks),
    do: parse(rest, stack_number + 1, stacks)

  # Matches instructions beginning and end of recursion
  defp parse("move " <> _rest = instructions, _stack_number, stacks) do
    moves =
      String.split(instructions, "\n", trim: true)
      |> Enum.map(fn instruction ->
        [_, nb, _, from, _, to] = String.split(instruction)
        %{from: from, to: to, nb: String.to_integer(nb)}
      end)

    stacks = Enum.map(stacks, fn {k, v} -> {k, Enum.reverse(v)} end) |> Enum.into(%{})
    %{stacks: stacks, instructions: moves}
  end

  # Unknown character
  defp parse(<<_::utf8, rest::binary>>, stack_number, stacks) do
    parse(rest, stack_number, stacks)
  end
end
