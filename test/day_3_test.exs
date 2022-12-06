defmodule AdventOfCode.Day3Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day3

  @moduletag day: 3

  test "part 1 test input", ctx do
    assert Day3.part_1(ctx.test_input) == 157
  end

  test "part 1 input", ctx do
    assert Day3.part_1(ctx.input) == 7742
  end

  test "part 2 test input", ctx do
    assert Day3.part_2(ctx.test_input) == 70
  end

  test "part 2 input", ctx do
    assert Day3.part_2(ctx.input) == 2276
  end
end
