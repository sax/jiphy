defmodule Jiphy.Giphy.Store do
  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def put(key, value) do
    :ok = Agent.update(__MODULE__, &Map.put(&1, key, value))
    value
  end
end
