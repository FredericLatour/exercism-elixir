defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 1)
  end

  defp palette_bit_size(color_count, acc) do
    cond do
      Integer.pow(2, acc) >= color_count -> acc
      true -> palette_bit_size(color_count, acc + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, _) when picture == <<>> do
    nil
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first::size(bit_size), _::bitstring>> = picture
    first
  end

  def drop_first_pixel(picture, _) when picture == <<>> do
    <<>>
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
