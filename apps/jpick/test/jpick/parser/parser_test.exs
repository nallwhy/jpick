defmodule Jpick.PathParserTest do
  use Jpick.BaseCase

  describe "parse/1" do
    test "parse valid inputs with multiple dots" do
      assert PathParser.parse("data.field") == {:ok, ["data", "field"]}
    end

    test "parse valid inputs with []" do
      assert PathParser.parse("data[0]") == {:ok, ["data", 0]}
    end

    test "parse valid inputs with {}" do
      assert PathParser.parse("data.{field0, field1}") == {:ok, ["data", [["field0"], ["field1"]]]}
    end

    test "parse invalid inputs" do
      assert PathParser.parse("data...") == {:error, :invalid_path}
    end
  end
end
