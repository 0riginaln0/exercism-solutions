defmodule SecretsMacro do
  defmacro secret_func(name, operation, module \\ Kernel) do
    quote do
      def unquote(name)(secret), do: &unquote(module).unquote(operation)(&1, secret)
    end
  end
end

defmodule Secrets do
  import SecretsMacro

  secret_func :secret_add,      :+
  secret_func :secret_subtract, :-
  secret_func :secret_multiply, :*
  secret_func :secret_divide,   :div
  secret_func :secret_and,      :band, Bitwise
  secret_func :secret_xor,      :bxor, Bitwise

  def secret_combine(secret_function1, secret_function2) do
    &(&1 |> then(secret_function1) |> then(secret_function2))
  end
end
