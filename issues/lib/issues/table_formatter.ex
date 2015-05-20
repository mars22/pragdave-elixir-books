defmodule Issues.TableFormatter do
  
  def print_table_for_columns(list,columns) do
    
    data_by_column  = split_data_by_column(list, columns)
    columns_width   = width_of(data_by_column) 
    format          = format_for(columns_width)

    puts_one_line_in_columns columns, format
    IO.puts separator(columns_width)
    puts_in_columns data_by_column, format
  end
  
  def split_data_by_column(rows, columns) do
    for column <- columns do
      for row <- rows, do: printable(row[column])
    end
  end
  
  @doc """
    Return a binary (string) version of our parameter.
      ## Examples
      iex> Issues.TableFormatter.printable("a")
      "a"
      iex> Issues.TableFormatter.printable(99)
      "99"
  """
  def printable(data) when is_binary(data), do: data
  def printable(data) , do: to_string(data)

  def width_of(columns) do
    for column <- columns, do: column |> Enum.map(&String.length/1) |> Enum.max
  end
  
  
  def format_for(columns_width) do
    Enum.map_join(columns_width," | ", fn width -> "~-#{width}s" end) <> "~n"
  end

  def puts_in_columns(data_by_columns, format) do
    data_by_columns
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.each(&puts_one_line_in_columns(&1, format))
  end

  

  def separator(column_widths) do
    Enum.map_join(column_widths, "-+-", fn width -> List.duplicate("-", width) end)
  end

  def puts_one_line_in_columns(fields, format) do
    :io.format(format, fields)
  end
end