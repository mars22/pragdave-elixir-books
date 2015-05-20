defmodule Client do
  
  @spec outher_func :: non_neg_integer
  def outher_func do
    Simple.count_atoms([:a,:b,:c])
  end
  
end