defmodule Exkii.CLI do
  @doc """
  Main function
  """
  def main(argv) do
    {options, _, _} =
      OptionParser.parse(argv,
        switches: [text: :string],
        # makes '-t' an alias of '--text'
        aliases: [t: :text]
      )

    try do
      Exkii.Text.print(options[:text])
    rescue
      e in RuntimeError ->
        e
        IO.puts(e.message)
    end
  end
end
