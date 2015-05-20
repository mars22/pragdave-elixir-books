defmodule Time do

  def triple(a), do: a*3
end


defmodule Factorial do
	def of(0), do: 1
  def of(n) when n >0, do: n * of(n-1)
end

defmodule Gcd do
  def of(x,0), do: x
  def  of(x,y), do: of(y,rem(x,y))
end
