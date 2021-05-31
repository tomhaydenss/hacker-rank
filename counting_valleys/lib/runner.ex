defmodule Runner do
  alias CountingValleys

  def run do
    with {:ok, steps} <- read_steps(),
         {:ok, path} <- read_path() do
      CountingValleys.count(steps, path)
    else
      {:error, _reason} = error -> error
    end
  end

  defp read_steps() do
    with {:ok, input} <- read_input(),
         {:ok, steps} <- validate_steps_input(input) do
      {:ok, steps}
    else
      {:error, _} = error -> error
    end
  end

  defp validate_steps_input(input, max_steps_input \\ round(:math.pow(10, 6))) do
    input
    |> String.to_integer()
    |> case do
      steps when steps in 2..max_steps_input -> {:ok, steps}
      _ -> {:error, :invalid_steps_input}
    end
  end

  defp read_path(), do: read_input()

  defp read_input() do
    case IO.read(:stdio, :line) do
      :eof -> {:error, :unable_to_read}
      "\n" -> {:error, :unable_to_read}
      input -> {:ok, String.trim(input)}
    end
  end
end
