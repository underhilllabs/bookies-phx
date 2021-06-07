defmodule Bookies.Tags do
  use Ecto.Type
  def type, do: {:array, :string}

  def cast(nil), do: {:ok, nil} # if nil is valid to you
  def cast(str) when is_binary(str) do
    str
    |> String.replace(~r/\s/, "") # remove all whitespace
    |> String.split(",")
    |> cast
  end
  def cast(arr) when is_list(arr) do
    if Enum.all?(arr, &String.valid?/1), do: {:ok, arr}, else: :error
  end
  def cast(_), do: :error

  def dump(val) when is_list(val), do: {:ok, val}
  def dump(_), do: :error

  def load(val) when is_list(val) do
    {:ok, Enum.join(val, ", ") }
  end
  def load(_), do: :error
end
