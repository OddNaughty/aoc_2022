defmodule AdventOfCode.Day1Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day1

  @moduletag day: 1

  test "part 1 test input", ctx do
    assert Day1.part_1(ctx.test_input) == 24000
  end

  test "part 1 input", ctx do
    assert Day1.part_1(ctx.input) == 67450
  end

  test "part 2 test input", ctx do
    assert Day1.part_2(ctx.test_input) == 45000
  end

  test "part 2 input", ctx do
    assert Day1.part_2(ctx.input) == 199357
  end
end
