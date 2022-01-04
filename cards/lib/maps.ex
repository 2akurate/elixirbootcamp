defmodule MyMaps do

  def examples do
    colors = %{primary: "red"}
    colors2 = Map.put(colors, :secondary, "blue") # can update, insert kvps
    %{colors2 | secondary: "yellow"} # cannot add new kvp using this method
  end

end
