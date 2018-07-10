defmodule App do
  @moduledoc """
  Main Application. it consists in a simple game. of a player choose a number between 1 and 10 and if it's equals to a random generated number the player wins!
  """
  defmodule User do
    @moduledoc """
    User module, it will check the user data.
    """
    defstruct [:name, :age]

    def check(user) do
      if user.age < 18 do
        IO.puts "Apenas maiores de idade são permitidos aqui."
        App.start()
      end
      user
    end

  end

  defmodule Lottery do
    @moduledoc """
    Lottery module, receive two numbers and compare them.
    """
    defstruct [:number, :r_number]

    def check(lottery) do
      if lottery.number < 1 and lottery.number > 10 do
        IO.puts "Você precisa inserir um numero de 1 a 10"
        App.start()
      end
      lottery
    end

    def compare(lottery) do
      if lottery.number != lottery.r_number do
        IO.puts "Você errou o numero era #{lottery.r_number} e você escolheu #{lottery.number}"
        App.start()
      end
      {:ok, "Parabens você acertou! o numero era #{lottery.number}"}
    end

  end

  @doc """
  It will start the game and gets the number of the player and generate a new one.

  ## Parameters
    - user: User struct.

  """
  def start_game(user) do
    IO.puts "Bem-vindo #{user.name} ao nosso jogo!"
    {number, _} = IO.gets("Por-favor escolha um numero entre 1 a 10:\n")
      |> String.trim
      |> Integer.parse
    r_number = Enum.random 1..10
    lottery = %Lottery{number: number, r_number: r_number}
      |> Lottery.check
      |> Lottery.compare
  end

  @doc """
  That function will start all game.

  ## Examples
    iex> App.start
    Bem-vindo a nova versão da Roleta Russa do Katho em Elixir 2!
    [...]

  """
  def start do
    IO.puts "Bem-vindo a nova versão da Roleta Russa do Katho em Elixir 2!"
    name = IO.gets("Por favor digite seu nome:\n") |> String.trim
    {age, _} = IO.gets("Por favor digite sua idade:\n")
      |> String.trim
      |> Integer.parse
    user = %User{name: name, age: age}
      |> User.check
    start_game(user)
  end

end
