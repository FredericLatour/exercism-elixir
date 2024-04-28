defmodule ResistorColorTrioTest do
  use ExUnit.Case

  @module_to_test ResistorColorTrio2

  # @tag :pending
  test "Orange and orange and black" do
    colors = [:orange, :orange, :black]
    output = @module_to_test.label(colors)
    expected = {33, :ohms}
    assert output == expected
  end

  @tag :pending
  test "Blue and grey and brown" do
    colors = [:blue, :grey, :brown]
    output = @module_to_test.label(colors)
    expected = {680, :ohms}
    assert output == expected
  end

  @tag :pending
  test "Red and black and red" do
    colors = [:red, :black, :red]
    output = @module_to_test.label(colors)
    expected = {2, :kiloohms}
    assert output == expected
  end

  @tag :pending
  test "Green and brown and orange" do
    colors = [:green, :brown, :orange]
    output = @module_to_test.label(colors)
    expected = {51, :kiloohms}
    assert output == expected
  end

  @tag :pending
  test "Yellow and violet and yellow" do
    colors = [:yellow, :violet, :yellow]
    output = @module_to_test.label(colors)
    expected = {470, :kiloohms}
    assert output == expected
  end

  @tag :pending
  test "Blue and violet and blue" do
    colors = [:blue, :violet, :blue]
    output = @module_to_test.label(colors)
    expected = {67, :megaohms}
    assert output == expected
  end

  @tag :pending
  test "Minimum possible value" do
    colors = [:black, :black, :black]
    output = @module_to_test.label(colors)
    expected = {0, :ohms}
    assert output == expected
  end

  @tag :pending
  test "Maximum possible value" do
    colors = [:white, :white, :white]
    output = @module_to_test.label(colors)
    expected = {99, :gigaohms}
    assert output == expected
  end

  @tag :pending
  test "First two colors make an invalid octal number" do
    colors = [:black, :grey, :black]
    output = @module_to_test.label(colors)
    expected = {8, :ohms}
    assert output == expected
  end

  @tag :pending
  test "Ignore extra colors" do
    colors = [:blue, :green, :yellow, :orange]
    output = @module_to_test.label(colors)
    expected = {650, :kiloohms}
    assert output == expected
  end
end
