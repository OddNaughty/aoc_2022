ExUnit.start()

defmodule AdventOfCode.TestCase do
  use ExUnit.CaseTemplate

  setup %{day: day} do
    [
      test_input: File.read!("test/support/day_#{day}_test_input.txt"),
      input: File.read!("test/support/day_#{day}_input.txt")
    ]
  end
end
