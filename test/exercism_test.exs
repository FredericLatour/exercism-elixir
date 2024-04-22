defmodule ExercismTest do
  use ExUnit.Case
  doctest Exercism

  test "greets the world" do
    assert Exercism.hello() == :world
  end

  test "secret_divide" do
    secret_divide = Secrets.secret_divide(3)
    assert secret_divide.(32) == 10
  end

  test "secret_and" do
    secret_and = Secrets.secret_and(1)
    assert secret_and.(2) == 0
  end

  test "secret_xor" do
    secret_xor = Secrets.secret_xor(1)
    assert secret_xor.(3) == 2
  end

  test "secret_combine" do
    multiply = Secrets.secret_multiply(7)
    divide = Secrets.secret_divide(3)
    combine = Secrets.secret_combine(multiply, divide)
    assert combine.(6) == 14
  end
end
