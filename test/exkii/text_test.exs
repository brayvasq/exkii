defmodule Exkii.TextTest do
  use ExUnit.Case
  doctest Exkii

  test ".alphabet" do
    assert Exkii.Text.alphabet == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  end

  test ".banner" do
    assert Exkii.Text.banner("I") == "\n_________\n\\__   __/\n   ) (   \n   | |   \n   | |   \n   | |   \n___) (___\n\\_______/"
  end

  test ".get_text" do
    assert Exkii.Text.get_text(["I"], 0, 1, "") == "\n_________\n\\__   __/\n   ) (   \n   | |   \n   | |   \n   | |   \n___) (___\n\\_______/"
  end

  test ".get_row" do
    assert Exkii.Text.get_row(["I"], 0, 0, 1, "") == "_________"
  end

  test ".get_column" do
    assert Exkii.Text.get_column(8, 0) == "_________"
  end
end
