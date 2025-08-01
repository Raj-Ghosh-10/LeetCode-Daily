defmodule Pascal do
  def next([1]) do
    [1, 1]
  end

  def next(prev) do
    prev
    |> Stream.chunk_every(2, 1, [0])
    |> Enum.map(fn [a, b] -> a + b end)
    |> then(&[1 | &1])
  end
end

defmodule Solution do
  @pascal (
    [1]
    |> Stream.iterate(&Pascal.next/1)
    |> Enum.take(30)
    |> Enum.scan([], &[&1 | &2])
    |> Enum.map(&Enum.reverse/1)
    |> List.to_tuple()
  )

  @spec generate(num_rows :: integer) :: [[integer]]
  def generate(num_rows) do
    elem(@pascal, num_rows - 1)
  end
end