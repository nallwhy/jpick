defmodule Jpick.Fixture do
  alias Jpick.JsonParser

  def read(path) do
    fixture_path(path) |> File.read!()
  end

  def json(path) do
    read(path) |> JsonParser.decode!()
  end

  defp fixture_path(path) do
    "#{__DIR__}/fixtures/#{path}"
  end
end
