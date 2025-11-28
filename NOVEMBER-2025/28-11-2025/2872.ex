defmodule Solution do
  @spec max_k_divisible_components(
    n :: pos_integer,
    edges :: [[non_neg_integer]],
    values :: [pos_integer],
    k :: pos_integer
  ) :: pos_integer
  def max_k_divisible_components(1, _edges, _values, _k) do
    1
  end

  def max_k_divisible_components(_n, edges, values, k) do
    xs = List.to_tuple(values)

    adjacency_table =
      Enum.reduce(edges, %{}, fn [a, b], map ->
        pa = {a, elem(xs, a)}
        pb = {b, elem(xs, b)}

        map
        |> Map.update(pa, [pb], &[pb | &1])
        |> Map.update(pb, [pa], &[pa | &1])
      end)

    root =
      adjacency_table
      |> Enum.at(0)
      |> elem(0)

    tree = build_tree(adjacency_table, k, root, nil)

    count_zeroes(tree, 0)
  end

  @typep tree() :: {
    value :: non_neg_integer(),
    children :: [tree()]
  }

  @spec count_zeroes(tree(), count) :: count
        when count: non_neg_integer()
  defp count_zeroes({value, children}, count) do
    count = (value == 0) && (count + 1) || count
    Enum.reduce(children, count, &count_zeroes/2)
  end

  @spec build_tree(
    %{{index, value} => [{index, value}]},
    k :: pos_integer(),
    current :: {index, value},
    parent :: nil | {index, value}
  ) :: tree()
  when index: non_neg_integer(),
       value: pos_integer()
  defp build_tree(adjacency_table, k, {_i, x} = current, parent) do
    children =
      (adjacency_table[current] || [])
      |> Stream.reject(& &1 == parent)
      |> Enum.map(&build_tree(adjacency_table, k, &1, current))

    current_value =
      children
      |> Stream.map(&elem(&1, 0))
      |> Enum.reduce(rem(x, k), fn child_value, sum_mod_k ->
        rem(sum_mod_k + child_value, k)
      end)

    {current_value, children}
  end
end