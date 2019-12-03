defmodule Jpick.CaseHelper do
  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)

      alias unquote(get_test_target_module(__CALLER__.module))
      alias Jpick.Fixture
    end
  end

  defp get_test_target_module(module) do
    splits = module |> Module.split()
    new_last = splits |> List.last() |> String.trim_trailing("Test")

    ((splits |> Enum.slice(0..-2)) ++ [new_last])
    |> Module.concat()
  end
end
