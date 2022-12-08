defmodule AdventOfCode.Day5Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day5

  @moduletag day: 5

  test "part 1 test input", ctx do
    assert Day5.part_1(ctx.test_input) == 'CMZ'
  end

  test "part 1 input", ctx do
    assert Day5.part_1(ctx.input) == 'TBVFVDZPN'
  end

  test "part 2 test input", ctx do
    assert Day5.part_2(ctx.test_input) == 'MCD'
  end

  test "part 2 input", ctx do
    assert Day5.part_2(ctx.input) == 'VLCWHTDSZ'
  end
end
