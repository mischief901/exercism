defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([ _hd | tl ]), do: 1 + count(tl)

  @spec reverse(list) :: list
  def reverse(list), do: revapp(list, [])
  defp revapp([hd | tl], list) do
    revapp(tl, [hd | list])
  end
  defp revapp([], list), do: list

  @spec map(list, (any -> any)) :: list
  def map([ hd | tl ], f) do
    [ f.(hd) | map(tl, f) ]
  end
  def map([], _f), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f?), do: []
  def filter([ hd | tl ], f?) do
    cond do
      f?.(hd) ->
        [ hd | filter(tl, f?) ]
      true ->
        filter(tl, f?)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([ hd | tl ], acc, f) do
    reduce(tl, f.(hd, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append([ha | ta], b) do
    [ ha | append(ta, b) ]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([ hd | tl ]) do
    append(hd, concat(tl))
  end
end
