defmodule Jiphy.Giphy.Scheduler do
  use GenServer

  alias Jiphy.Giphy

  require Logger

  def start_link(search) do
    GenServer.start_link(__MODULE__, search, name: :"#{search}")
  end

  def init(search) do
    schedule(5_000)
    {:ok, search}
  end

  def handle_info(:search, search_term) do
    search(search_term)
    schedule(15_000)
    {:noreply, search_term}
  end

  defp search(term) do
    image = Giphy.update(term)
    Logger.info("Updating image for #{term}: #{image}")
  end

  defp schedule(delay) do
    Process.send_after(self(), :search, delay)
  end
end
