defmodule Jpick.BaseCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Jpick.CaseHelper
      import unquote(__MODULE__)
    end
  end
end
