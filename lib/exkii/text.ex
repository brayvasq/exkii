defmodule Exkii.Text do
  @moduledoc """
  `Exkii.Text` module helps to transform a string
  into a ASCII art string
  """

  # Single letter ascii art with
  @width 9

  @doc """
  Returns a string with each alphabet letter.

  ## Examples

      iex> Exkii.Text.alphabet
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  """
  def alphabet do
    ?A..?Z |> Enum.to_list |> List.to_string
  end

  @doc """
  Read the template file to get the string used to create the ASCII art.

  ## Examples

      iex> Exkii.Text.read_file
      [" _______  ______   _______  ______   _______ ....", "......"", "...."]

  """
  def read_file do
    { _ , content } = Path.expand('./lib/txt/ascii.txt') |> Path.absname |> File.read
    content |> String.split("\n", trim: true)
  end

  @doc """
  Prints the `text` ascii art.

  ## Parameters

    - text: String to be represented as ASCII art.

  ## Examples

      iex> Exkii.Text.print "Hello"
                _______  _        _        _______ 
      |\     /|(  ____ \( \      ( \      (  ___  )
      | )   ( || (    \/| (      | (      | (   ) |
      | (___) || (__    | |      | |      | |   | |
      |  ___  ||  __)   | |      | |      | |   | |
      | (   ) || (      | |      | |      | |   | |
      | )   ( || (____/\| (____/\| (____/\| (___) |
      |/     \|(_______/(_______/(_______/(_______)
  
  """
  def print(text) do
    banner(text) |> IO.puts
  end

  @doc """
  Create an ascii art for the `text`

  Returns ascii art string.

  ## Parameters

    - text: String to be represented as ASCII art.

  ## Examples

      iex> Exkii.Text.banner "Hello"
      "\n          _______  _        _        _______ \n \\     /|(  ____ \\( \\      ( \\      (  ___  )\n ...."

  """
  def banner(text) do
    limit = String.length(text)
    str = text |> String.upcase |> String.graphemes
    get_text(str, 0, limit, "")
  end

  @doc """
  Iterates and concatenate the `str` to obtain an ascii art string.

  This function iterates each file of the file and concatenates 
  until the row is equal to or greater than the `ascii.txt` rows.

  Each `\n` represents a new concatenated column.

  Returns ascii art string.

  ## Parameters

    - str: Array that cotains each string character to be represented as ASCII art.
    - row: Number that represents the ASCII art row to obtain. can't be greater than `ascii.txt` rows.
    - limit: The string length
    - acc: String which will be concatenated to each row result

  ## Examples

      iex> Exkii.Text.get_text(["H", "E", "L", "L", "O"], 0, 5, "")
      "\n          _______  _        _        _______ \n \\     /|(  ____ \\( \\      ( \\      (  ___  )\n ...."

  """
  def get_text(_, row, _, acc) when row >= 8, do: acc
  def get_text(str, row, limit, acc) do
    line = get_row(str, 0, row, limit, "")
    get_text(str, row + 1, limit, acc <> "\n" <> line)
  end

  @doc """
  Iterates and concatenate the `str` to obtain a row for the ascii art.
  :index param can't be greater than str length.

  This function iterates each string character, gets the respective row portion
  and concatenate to the result. 
  until the index is equal to or greater than str length.

  Returns ascii art string row.

  ## Parameters

    - text: Array that cotains each string character to be represented as ASCII art.
    - index: Number that represents the index of a character. can't be greater than str length.
    - row: Number that represents the ASCII art row to obtain. can't be greater than `ascii.txt` rows.
    - limit: The string length
    - acc: String which will be concatenated to each column result

  ## Examples

      iex> Exkii.Text.get_row(["H", "E", "L", "L", "O"], 0, 0, 5, "")
      "          _______  _        _        _______ "

  """
  def get_row(_, index, _, limit, acc) when index >= limit, do: acc
  def get_row(text, index, row, limit, acc) do
    char = Enum.at(text, index)
    { position, _ } = :binary.match(Exkii.Text.alphabet(), char)
    line = get_column(position, row)
    get_row(text, index + 1, row, limit, acc <> line)
  end

  @doc """
  Gets a portion of the line that corresponds to the given character

  Returns ascii art character portion.

  ## Parameters
    - index: Number that represents the index of a character. can't be greater than str length.
    - row: Number that represents the ASCII art row to obtain. can't be greater than `ascii.txt` rows.

  ## Examples

      iex> Exkii.Text.get_column(8, 0)
      "_________"

  """
  def get_column(_, _, row) when row >= 8, do: ""
  def get_column(index, row) do
    line = Enum.at(read_file(), row)
    start_point = index * @width
    end_point = start_point + @width
    String.slice(line, start_point..end_point-1)
  end
end
