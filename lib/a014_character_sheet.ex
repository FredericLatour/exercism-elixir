defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name() :: binary()
  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim() |> String.to_integer()
  end

  def run() do
    welcome()
    your_character = %{name: ask_name(), class: ask_class(), level: ask_level()}
    IO.inspect(your_character, label: "Your character")
  end
end