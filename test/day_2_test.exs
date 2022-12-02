defmodule AdventOfCode.Day2Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day2

  @moduletag day: 2

  test "part 1 test input", ctx do
    assert Day2.part_1(ctx.test_input) == 15
  end

  test "part 1 input", ctx do
    assert Day2.part_1(ctx.input) == 9651
  end

  test "part 2 test input", ctx do
    assert Day2.part_2(ctx.test_input) == 12
  end

  test "part 2 input", ctx do
    assert Day2.part_2(ctx.input) == 10560
  end
end
