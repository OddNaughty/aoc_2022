defmodule AdventOfCode.Day6Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day6

  @moduletag day: 6

  test "part 1 test input", ctx do
    assert Day6.part_1(ctx.test_input) == 7
  end

  test "part 1 input", ctx do
    assert Day6.part_1(ctx.input) == 1300
  end

  test "part 2 test input", ctx do
    assert Day6.part_2(ctx.test_input) == 19
  end

  test "part 2 input", ctx do
    assert Day6.part_2(ctx.input) == 3986
  end
end
