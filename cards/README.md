# Code Notes
## Maps
```elixir
colors = %{primary: "red", secondary: "blue"}
colors.primary
>> "red"
%{primary: red_here} = colors
red_here
>> "red"
```

### Update Map
```elixir
colors2 = Map.put(colors, :primary, "green")
colors3 = %{colors2 | primary: "red"}
```
### Add to existing map
```elixir
colors2 = Map.put(colors, :tertiary, "green")  
```
## Key Word List
```elixir
colors = [{:primary, "red"}, {:secondary, "green"}]
colors[:primary] 
```