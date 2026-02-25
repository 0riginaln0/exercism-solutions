defmodule PaintByNumber do
  defp calculate_pallete_bit_size(color_count, bit_size) do
    if color_count <= 2 ** bit_size do
      bit_size
    else
      calculate_pallete_bit_size(color_count, bit_size + 1)
    end
  end

  def palette_bit_size(color_count) do
    calculate_pallete_bit_size(color_count, 1)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    bit = palette_bit_size(color_count)

    try do
      <<first_pixel::size(bit), _::bitstring>> = picture
      first_pixel
    rescue
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    bit = palette_bit_size(color_count)

    try do
      <<_::size(bit), rest::bitstring>> = picture
      rest
    rescue
      _ -> <<>>
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
