defmodule AdventOfCode.Day4Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day4

  @moduletag day: 4

  test "part 1 test input", ctx do
    assert Day4.part_1(ctx.test_input) == 2
  end

  test "part 1 input", ctx do
    assert Day4.part_1(ctx.input) == 513
  end

  test "part 2 test input", ctx do
    assert Day4.part_2(ctx.test_input) == 4
  end

  test "part 2 input", ctx do
    assert Day4.part_2(ctx.input) == 878
  end
end
