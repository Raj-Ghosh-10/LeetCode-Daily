defmodule Solution do
  @spec is_power_of_four(n :: integer) :: boolean
  def is_power_of_four(n) when n<=0, do: false
  def is_power_of_four(n) when n==1, do: true
  def is_power_of_four(n) do
    if rem(n,4)==0 do
        is_power_of_four(div(n,4))
    else 
        false
    end
  end
end