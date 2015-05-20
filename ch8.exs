defmodule Subscriber do
  @derive  Access
  defstruct name: "", age: 0 ,email: "" ,subs: false

  def send_newsletter(subscriber = %Subscriber{subs: true, email: email}) when email != "" do
     IO.puts "Newsletter sended to #{subscriber.name}"
  end
    
end


defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  @derive Access
  defstruct owner: %{}, details: "", severity: 1
end