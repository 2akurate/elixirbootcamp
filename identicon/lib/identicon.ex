defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{ hex: hex }
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail ]} = image) do
     %Identicon.Image{image | rgb: {r, g, b}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = Enum.chunk(hex, 3)
    |> Enum.map(&mirror_chunk/1)
    |> List.flatten
    |> Enum.with_index
    %Identicon.Image{image | grid: grid}
  end

  def mirror_chunk(chunk) do
    [first, second | _tail] = chunk
    chunk ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({x, _index }) -> rem(x, 2) == 0 end

    %Identicon.Image{image | grid: grid }
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50
        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def draw_image(%Identicon.Image{rgb: rgb, pixel_map: pixel_map}) do
    canvas = :egd.create(250, 250)
    fill = :egd.color(rgb)

    Enum.each pixel_map, fn({top_left, bottom_right}) ->
      :egd.filledRectangle(canvas, top_left, bottom_right, fill) # filledRectangle actually mutates 'canvas' (abnormal for erlang)
    end

    :egd.render(canvas)
  end

  def save_image(image, filename) do
    File.write("#{filename}.png", image)
  end
end
