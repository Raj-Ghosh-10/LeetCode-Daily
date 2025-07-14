# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec get_decimal_value(head :: ListNode.t | nil) :: integer
  def get_decimal_value(head), do: do_get_decimal_value(head, 0)

  defp do_get_decimal_value(%ListNode{val: v, next: next}, acc), do: do_get_decimal_value(next, (acc * 2) + v)
  defp do_get_decimal_value(_, acc), do: acc
end