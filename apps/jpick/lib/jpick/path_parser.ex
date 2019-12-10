defmodule Jpick.PathParser do
  def parse(str) do
    with {:ok, tokens, _} <- :path_lexer.string(to_charlist(str)),
         {:ok, result} <- :path_parser.parse(tokens) do
      result
    else
      {:error, reason, _} ->
        reason

      {:error, {_, :path_parser, reason}} ->
        to_string(reason)
    end
  end

  # # data.path[0][1].{field0, {field1.0.wow0}, field2}
  # # ["data", "path", 0, 1, [["field0"], ["field1", 0, "wow0"], ["field2"]]]

  # def parse(path) do
  #   {:ok, path |> replace_squre_bracekts() |> do_parse()}
  # rescue
  #   _e -> {:error, :invalid_path}
  # end

  # defp do_parse(str) do
  #   case str |> brackets?() do
  #     false ->
  #       str
  #       |> split_by_without_bracket(".")
  #       |> IO.inspect()
  #       |> case do
  #         [""] -> raise "error"
  #         [part] -> part |> convert_to_integer_if_possible()
  #         [_ | _] = parts -> parts |> Enum.map(&do_parse/1)
  #       end

  #     true ->
  #       str |> do_parse_bracket_part()
  #   end

  #   # case path |> split_by_bracket() do
  #   #   [normal_part, bracket_part] ->
  #   #     do_parse_normal_part(normal_part) ++ do_parse_bracket_part(bracket_part)

  #   #   [normal_part] ->
  #   #     do_parse_normal_part(normal_part)
  #   # end
  # end

  # defp brackets?(str) do
  #   str |> IO.inspect()
  #   Regex.match?(~r/^{.*}$/, str) |> IO.inspect()
  # end

  # defp do_parse_normal_part(part) do
  #   part
  #   |> String.split(".")
  #   |> Enum.map(&convert_to_integer_if_possible/1)
  # end

  # defp do_parse_bracket_part(part) do
  #   part
  #   |> String.slice(1..-2)
  #   |> split_by_without_bracket(",")
  #   |> Enum.map(&[do_parse(&1)])
  # end

  # defp replace_squre_bracekts(path) do
  #   Regex.replace(~r/\[([^\[\]]+)\]/, path, ".\\1")
  # end

  # # "field0, {sub_field0, sub_field1}, field2"
  # defp split_by_bracket(path) do
  #   Regex.split(~r/\{.+\}/, path, include_captures: true, trim: true)
  # end

  # defp split_by_without_bracket(str, spliter) do
  #   spliter
  #   |> Regex.escape()
  #   |> Kernel.<>("(?=(?:[^\{\}]*(\{|\})[^\{\}]*(\{|\}))*[^\{\}]*$)")
  #   |> Regex.compile!()
  #   |> Regex.split(str)
  #   |> Enum.map(&String.trim/1)
  # end

  # defp convert_to_integer_if_possible(string) do
  #   case Integer.parse(string) do
  #     {integer, _} -> integer
  #     _ -> string
  #   end
  # end

  # # @spliters ~w(. {)

  # # defp do_parse(path, result) when is_binary(path) do
  # #   {remains, part} =
  # #     case path |> String.split(@spliters, parts: 2) do
  # #       [part, remains] -> {remains, result ++ [part]}
  # #       [part] -> {nil, result ++ [part]}
  # #     end

  # #   do_parse(remains, result ++ [part])
  # # end

  # # defp do_parse(nil, result), do: result
end
