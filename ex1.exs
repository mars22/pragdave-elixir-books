fuzbuz = fn
  (0,0,_) -> "FizzBuzz"
  (0,_,_) -> "Fizz"
  (_,0,_) -> "Buzz"
  (_,_,val) -> val
end

IO.puts fuzbuz.(0,0,1)
IO.puts fuzbuz.(0,1,1)
IO.puts fuzbuz.(1,0,1)
IO.puts fuzbuz.(3,3,8)
