if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("pascals_triangle.exs", __DIR__)
end


ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule PascalsTriangleTest do
  use ExUnit.Case

  # @tag pending
  test "one row" do
    assert PascalsTriangle.rows(1) == [[1]]
  end

  #@tag :pending
  test "two rows" do
    assert PascalsTriangle.rows(2) == [[1], [1, 1]]
  end

  #@tag :pending
  test "three rows" do
    assert PascalsTriangle.rows(3) == [[1], [1, 1], [1, 2, 1]]
  end

  #@tag :pending
  test "fourth row" do
    assert List.last(PascalsTriangle.rows(4)) ==  [1, 3, 3, 1]
  end

  #@tag :pending
  test "fifth row" do
    assert List.last(PascalsTriangle.rows(5)) ==  [1, 4, 6, 4, 1]
  end

  #@tag :pending
  test "twentieth row" do
    expected = [
      1, 19, 171, 969, 3876, 11_628, 27_132, 50_388, 75_582, 92_378, 92_378,
      75_582, 50_388, 27_132, 11_628, 3876, 969, 171, 19, 1
    ]
    assert List.last(PascalsTriangle.rows(20)) ==  expected
  end


    test "thirtieth row" do
    expected = [
      1, 29, 406, 3654, 23751, 118755, 475020, 1560780, 4292145, 10015005, 20030010,
 34597290, 51895935, 67863915, 77558760, 77558760, 67863915, 51895935, 34597290,
 20030010, 10015005, 4292145, 1560780, 475020, 118755, 23751, 3654, 406, 29, 1
    ]
    assert List.last(PascalsTriangle.rows(30)) ==  expected
  end
end
