defmodule Jpick.JsonParser do
  defdelegate encode(input, opts \\ []), to: Jason
  defdelegate encode!(input, opts \\ []), to: Jason
  defdelegate decode(input, opts \\ []), to: Jason
  defdelegate decode!(input, opts \\ []), to: Jason
end
