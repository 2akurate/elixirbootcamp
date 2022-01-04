
# getting started
iex -S mix
recompile

# installing package that was added to mix.exs
mix deps.get

# creating documentation with ex_doc
mix docs


# Code Notes
## Maps
colors = %{primary: "red", secondary: "blue"}
colors.primary
>> "red"
%{primary: red_here} = colors
red_here
>> "red"

### Update Map
colors2 = Map.put(colors, :primary, "green")
colors3 = %{colors2 | primary: "red"}

### Add to existing map
colors2 = Map.put(colors, :tertiary, "green")  

## Key Word List
colors = [{:primary, "red"}, {:secondary, "green"}]
colors[:primary] 