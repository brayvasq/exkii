defmodule Exkii.Text do
  @width 9

  def alphabet do
    ?A..?Z |> Enum.to_list |> List.to_string
  end

  def read_file do
    { _ , content } = Path.expand('./lib/txt/ascii.txt') |> Path.absname |> File.read
    content |> String.split("\n", trim: true)
  end

  def print(text) do
    IO.puts banner(text)
  end

  def banner(text) do
    limit = String.length(text)
    str = text |> String.upcase |> String.graphemes
    get_text(str, 0, limit, "")
  end

  def get_text(_, column, _, acc) when column >= 8, do: acc
  def get_text(str, column, limit, acc) do
    line = get_column(str, 0, column, limit, "")
    get_text(str, column + 1, limit, acc <> "\n" <> line)
  end

  def get_column(_, index, column, limit, acc) when index >= limit, do: acc
  def get_column(text, index, column, limit, acc) do
    char = Enum.at(text, index)
    { position, _ } = :binary.match(Exkii.Text.alphabet(), char)
    line = get_line(position, column)
    get_column(text, index + 1, column, limit, acc <> line)
  end

  def get_line(_, _, column) when column >= 8, do: ""
  def get_line(index, column) do
    line = Enum.at(read_file, column)
    start_point = index * @width
    end_point = start_point + @width
    portion = String.slice(line, start_point..end_point-1)
  end

end
