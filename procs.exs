defmodule Procs do
  def hello(count) do
    receive do
      {:crash, reason} ->
        exit(reason)
      {:quit} ->
        IO.puts "Go Home"
        :reset ->
          IO.puts "Count is 0"
          hello(0)
      {:add, n} ->
        hello(count+n)
      msg -> IO.puts("#{count}: Hello #{inspect msg}")
      hello(count)
    end

  end
end
