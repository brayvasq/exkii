# Exkii
This is a simple lib to convert text to ASCII banner

## Run project
Compile project
```bash
mix escript.build
```

## Usage
To use the project as an application, yow have to compile the project.
```bash
./exkii --text "HELLO"

          _______  _        _        _______ 
|\     /|(  ____ \( \      ( \      (  ___  )
| )   ( || (    \/| (      | (      | (   ) |
| (___) || (__    | |      | |      | |   | |
|  ___  ||  __)   | |      | |      | |   | |
| (   ) || (      | |      | |      | |   | |
| )   ( || (____/\| (____/\| (____/\| (___) |
|/     \|(_______/(_______/(_______/(_______)
```

Also, you can test the project using iex.

```bash
iex -S mix
```

Into the iex
```elixir
# Text to ASCII Art
Exkii.Text.print "Hello"

          _______  _______  _        ______  
|\     /|(  ___  )(  ____ )( \      (  __  \ 
| )   ( || (   ) || (    )|| (      | (  \  )
| | _ | || |   | || (____)|| |      | |   ) |
| |( )| || |   | ||     __)| |      | |   | |
| || || || |   | || (\ (   | |      | |   ) |
| () () || (___) || ) \ \__| (____/\| (__/  )
(_______)(_______)|/   \__/(_______/(______/ 
:ok
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exkii` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exkii, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exkii](https://hexdocs.pm/exkii).

## Credits
- [@brayvasq](https://github.com/brayvasq) - creator and maintainer
- I took the `ascii.txt` file from https://gist.github.com/tutorialcode/69790c920e8eca1076d974f13cef1631
