defmodule AdventOfCode2022.Day7.Directory do
  defstruct [:path, :children]
end

defmodule AdventOfCode2022.Day7.File do
  defstruct [:path, :size]
end

defmodule AdventOfCode2022.Day7 do
  alias AdventOfCode2022.Day7.Directory
  alias AdventOfCode2022.Day7.File

  # You browse around the filesystem to assess the situation and save the resulting terminal output (your puzzle input). For example:
  @test_input """
    $ cd /
    $ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    $ cd a
    $ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    $ cd e
    $ ls
    584 i
    $ cd ..
    $ cd ..
    $ cd d
    $ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
  """

  # The tree output:
  # - / (dir)
  # - a (dir)
  #   - e (dir)
  #     - i (file, size=584)
  #   - f (file, size=29116)
  #   - g (file, size=2557)
  #   - h.lst (file, size=62596)
  # - b.txt (file, size=14848514)
  # - c.dat (file, size=8504156)
  # - d (dir)
  #   - j (file, size=4060174)
  #   - d.log (file, size=8033020)
  #   - d.ext (file, size=5626152)
  #   - k (file, size=7214296)
  """
  %{
    "/" => [{b.txt, 14848514}, {c.dat, 8504156}],
    "/a" => [{f, 29116}, {g, 2557}, {h.lst, 62596}],
    "/a/e" => [{i, 584}],
    "/d" => [{j, 4060174}, {d.log, 8033020}, {d.ext, 5626152}, {k, 7214296}],
  }
  """

  %Directory{
    path: "/",
    children: [
      %Directory{
        path: "/a",
        children: [
          %Directory{
            path: "/a/e",
            children: [
              %File{path: "/a/e/i", size: 584}
            ]
          },
          %File{path: "/a/f", size: 29116},
          %File{path: "/a/g", size: 2557},
          %File{path: "/a/h.lst", size: 62596}
        ]
      },
      %File{path: "/a/b.txt", size: 14_848_514},
      %File{path: "/a/c.dat", size: 8_504_156},
      %Directory{
        path: "/d",
        children: [
          %File{path: "/d/j", size: 4_060_174},
          %File{path: "/d/d.log", size: 8_033_020},
          %File{path: "/d/d.ext", size: 5_626_152},
          %File{path: "/d/k", size: 7_214_296}
        ]
      }
    ]
  }

  @empty_root %Directory{path: "/", children: []}

  def parse(input) do
    commands =
      String.split(input, "$ ", trim: true)
      |> Enum.map(&String.split(&1, "\n", trim: true))

    initial_state = %{dir: @empty_root, cwd: "/"}

    Enum.reduce(commands, initial_state, fn command, %{dir: dir, cwd: cwd} = acc ->
      parse_command(command, acc)
    end)
  end

  def parse_command(["cd /"], state), do: Map.put(state, :cwd, "/")
  def parse_command(["cd " <> path], %{cwd: cwd} = state) do
    Map.put(state, :cwd, cwd <> path <> "/")
  end

  # defp parse_command_2(["cd .."]), do: raise("Not implemented yet")
  # defp parse_command_2(["cd " <> path], %{cwd: cwd} = state), do: Map.put(state, :cwd, state <> "/" <> path)

  def parse_command_camille(["cd /"], state), do: Map.put(state, :cwd, ["/"])
  def parse_command_camille(["cd .."], %{cwd: [_ | cwd]} = state), do: Map.put(state, :cwd, cwd)

  def parse_command_camille(["cd " <> path], %{cwd: cwd} = state),
    do: Map.put(state, :cwd, [path | cwd])

  # state: cwd: /
  # command: cd a -> %{dir: dir, cwd: /a}
  #
  # cd ..
  #
  # ls
  def parse_command(["ls" | elements], %{dir: dir, cwd: path} = state) do
    children =
      elements
      |> Enum.map(fn
        "dir " <> directory_name ->
          %Directory{path: directory_name, children: []}

        file ->
          [filesize, filename] = String.split(file)
          %File{path: filename, size: filesize}
      end)

    put_in(state, [Access.key!(:dir), Access.key!(:children)], children)
  end

  # [
  #   # command without ouptut,
  #   ["cd /"],
  #   # command with it's output (elem(0) is the command, rest is the output)
  #   ["ls", "dir a", "14848514 b.txt", "8504156 c.dat", "dir d"],
  #   # command wihouth output
  #   ["cd a"],
  #   # command is first element, rest is output
  #   ["ls", "dir e", "29116 f", "2557 g", "62596 h.lst"],
  #   ["cd e"],
  #   ["ls", "584 i"],
  #   ["cd .."],
  #   ["cd .."], ["cd d"], ["ls", "4060174 j", "8033020 d.log", "5626152 d.ext", "7214296 k"]]

  # Possible commands
  # ls
  # cd [path]
end
