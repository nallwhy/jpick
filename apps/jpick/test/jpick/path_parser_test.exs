defmodule Jpick.PathParserTest do
  use Jpick.BaseCase

  describe "parse/1" do
    test "parse valid inputs with multiple dots" do
      assert PathParser.parse("data.field0.field1") == {:ok, ["data", "field0", "field1"]}
    end

    test "parse valid inputs with []" do
      assert PathParser.parse("data[0][1]") == {:ok, ["data", 0, 1]}
    end

    test "parse valid inputs with {}" do
      assert PathParser.parse("data.{field0, {sub_field0, sub_field1}}") ==
               {:ok, ["data", [["field0"], [[["sub_field0"], ["sub_field1"]]]]]}
    end

    test "parse complicated inputs" do
      assert PathParser.parse("data.path[0][1].{field0, {field1[0].wow0, field1[1].wow1}}") ==
               {:ok, ["data", "path", 0, 1, [["field0"], [[["field1", 0, "wow0"], ["field1", 1, "wow1"]]]]]}
    end

    test "parse invalid inputs" do
      assert PathParser.parse("data...") == {:error, :invalid_path}
    end
  end
end
