defmodule CountingValleys do
  @spec count(non_neg_integer, binary) :: integer()
  def count(steps, path) do
    path
    |> String.graphemes()
    |> Enum.filter(&valid_step_only/1)
    |> Enum.slice(0, steps)
    |> do_count()
  end

  defp valid_step_only(step), do: step == "D" or step == "U"

  defp do_count(path) do
    {_current_level, valleys} =
      path
      |> Enum.map(fn step -> if step == "D", do: -1, else: 1 end)
      |> Enum.reduce({0, 0}, fn step, {current_level, valleys} ->
        next_level = current_level + step

        case {next_level, step} do
          {0, 1} ->
            {next_level, valleys + 1}

          _ ->
            {next_level, valleys}
        end
      end)

    valleys
  end
end
