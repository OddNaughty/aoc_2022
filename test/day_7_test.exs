defmodule AdventOfCode.Day7Test do
  use AdventOfCode.TestCase, async: true

  alias AdventOfCode2022.Day7
  alias AdventOfCode2022.Day7.File
  alias AdventOfCode2022.Day7.Directory

  @moduletag day: 7

  @parsed_input %Directory{
    path: "/",
    children: [
      %Directory{
        path: "a",
        children: [
          %Directory{
            path: "e",
            children: [
              %File{path: "i", size: 584}
            ]
          },
          %File{path: "f", size: 29116},
          %File{path: "g", size: 2557},
          %File{path: "h.lst", size: 62596}
        ]
      },
      %File{path: "b.txt", size: 14_848_514},
      %File{path: "c.dat", size: 8_504_156},
      %Directory{
        path: "d",
        children: [
          %File{path: "j", size: 4_060_174},
          %File{path: "d.log", size: 8_033_020},
          %File{path: "d.ext", size: 5_626_152},
          %File{path: "k", size: 7_214_296}
        ]
      }
    ]
  }

  test "parse the input", ctx do
    assert @parsed_input == Day7.parse(ctx.test_input)
  end

  test "parse ls", _ctx do
    assert %{
             cwd: "/",
             dir: %AdventOfCode2022.Day7.Directory{
               path: "/",
               children: [
                 %AdventOfCode2022.Day7.Directory{path: "a", children: []},
                 %AdventOfCode2022.Day7.File{path: "b.txt", size: "14848514"},
                 %AdventOfCode2022.Day7.File{path: "c.dat", size: "8504156"},
                 %AdventOfCode2022.Day7.Directory{path: "d", children: []}
               ]
             }
           } ==
             Day7.parse_command(["ls", "dir a", "14848514 b.txt", "8504156 c.dat", "dir d"], %{
               cwd: "/",
               dir: %Directory{path: "/", children: []}
             })
  end

  test "parse ls from a subdirectory", _ctx do
    assert %{
             cwd: "/a/",
             dir: %AdventOfCode2022.Day7.Directory{
               path: "/",
               children: [
                 %AdventOfCode2022.Day7.Directory{
                   path: "/a/",
                   children: [
                     %Directory{
                       path: "/a/e/",
                       children: []
                     },
                     %File{path: "/a/f", size: 29116},
                     %File{path: "/a/g", size: 2557},
                     %File{path: "/a/h.lst", size: 62596}
                   ]
                 },
                 %AdventOfCode2022.Day7.File{path: "b.txt", size: 14_848_514},
                 %AdventOfCode2022.Day7.File{path: "c.dat", size: 8_504_156},
                 %AdventOfCode2022.Day7.Directory{path: "d", children: []}
               ]
             }
           } ==
             Day7.parse_command(["ls", "dir e", "29116 f", "2557 g", "62596 h.lst"], %{
               cwd: "/a/",
               dir: %AdventOfCode2022.Day7.Directory{
                 path: "/",
                 children: [
                   %AdventOfCode2022.Day7.Directory{path: "a", children: []},
                   %AdventOfCode2022.Day7.File{path: "b.txt", size: 14_848_514},
                   %AdventOfCode2022.Day7.File{path: "c.dat", size: 8_504_156},
                   %AdventOfCode2022.Day7.Directory{path: "d", children: []}
                 ]
               }
             })
  end

  test "parse cd a", _ctx do
    %{cwd: "/a/"} =
      Day7.parse_command(["cd a"], %{
        cwd: "/",
        dir: %AdventOfCode2022.Day7.Directory{
          path: "/",
          children: [
            %AdventOfCode2022.Day7.Directory{path: "a", children: []},
            %AdventOfCode2022.Day7.File{path: "b.txt", size: "14848514"},
            %AdventOfCode2022.Day7.File{path: "c.dat", size: "8504156"},
            %AdventOfCode2022.Day7.Directory{path: "d", children: []}
          ]
        }
      })
  end

  test "parse cd ..", _ctx do
    %{cwd: "/a/"} =
      Day7.parse_command(["cd .."], %{
        cwd: "/a/e/",
        dir: %AdventOfCode2022.Day7.Directory{
          path: "/",
          children: [
            %AdventOfCode2022.Day7.Directory{path: "a", children: []},
            %AdventOfCode2022.Day7.File{path: "b.txt", size: "14848514"},
            %AdventOfCode2022.Day7.File{path: "c.dat", size: "8504156"},
            %AdventOfCode2022.Day7.Directory{path: "d", children: []}
          ]
        }
      })
  end

  # test "part 1 test input", ctx do
  #   assert Day7.part_1(ctx.test_input) == 95437
  # end

  # test "part 1 input", ctx do
  #   assert Day7.part_1(ctx.input) == 1300
  # end

  # test "part 2 test input", ctx do
  #   assert Day7.part_2(ctx.test_input) == 19
  # end

  # test "part 2 input", ctx do
  #   assert Day7.part_2(ctx.input) == 3986
  # end
end
