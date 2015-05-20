defmodule MyMacros do
  defmacro macro(code) do
    
    quote do
      def test do
        IO.puts "Before"
        IO.inspect unquote(code).()
        IO.puts "After"
      end
    end
  end

  defmacro if(condiction, clauses) do
    do_clasue = Keyword.get(clauses, :do, nil)
    else_clasue = Keyword.get(clauses, :else, nil)
    quote do
      case unquote(condiction) do
        val when val in [false, nil]  -> unquote(else_clasue)
        _ -> unquote(do_clasue)
      end
    end
  end

  defmacro time_n(n) do
    fn_name = String.to_atom("time_#{n}")
    quote do
      def unquote(fn_name)(arg) do
        unquote(n)
      end
    end
  end

  defmacro mydef(name) do
    quote bind_quoted: [name: name] do
      def unquote(name)() do
        unquote(name)
      end
    end
  end

end

defmodule My do
  require MyMacros
  MyMacros.macro fn -> 3+3 end
  MyMacros.time_n(3)

  [:ted, :zed] |> Enum.map(&MyMacros.mydef/1)
end