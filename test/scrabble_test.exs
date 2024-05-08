defmodule ScrabbleTest do
  use ExUnit.Case

  @module_to_test Scrabble

  test "empty word scores zero" do
    assert @module_to_test.score("") == 0
  end

  test "whitespace scores zero" do
    assert @module_to_test.score(" \t\n") == 0
  end

  test "uppercase letter" do
    assert @module_to_test.score("A") == 1
  end

  test "valuable letter" do
    assert @module_to_test.score("f") == 4
  end

  test "short word" do
    assert @module_to_test.score("at") == 2
  end

  test "short, valuable word" do
    assert @module_to_test.score("zoo") == 12
  end

  test "medium word" do
    assert @module_to_test.score("street") == 6
  end

  test "medium, valuable word" do
    assert @module_to_test.score("quirky") == 22
  end

  test "long, mixed-case word" do
    assert @module_to_test.score("OxyphenButazone") == 41
  end

  test "english-like word" do
    assert @module_to_test.score("pinata") == 8
  end

  test "entire alphabet available" do
    assert @module_to_test.score("abcdefghijklmnopqrstuvwxyz") == 87
  end
end
