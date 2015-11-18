defmodule UserInputTest do
  use ExUnit.Case
  doctest Movies

  import ExUnit.CaptureIO


  test "Promts the user" do
    prompt = capture_io(fn -> UserInput.prompt_user() end)
    assert prompt == "Enter the name of a movie:"
  end

  test "Strips and downcases the user input" do
  	user_input = "Martian\n"
  	assert UserInput.parse(user_input) == "martian"
  end

  test "If movie name has spaces replaces them with '%20'" do
    user_input = "The Martian\n"
    assert UserInput.parse(user_input) == "the%20martian"
  end
end