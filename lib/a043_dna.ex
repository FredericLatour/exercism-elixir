defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      32 -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> 32
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode(dna, acc) do
    case dna do
      [] -> acc
      [h | t] -> do_encode(t, <<acc::bitstring, encode_nucleotide(h)::size(4)>>)
    end
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(dna, acc) do
    case dna do
      <<>> -> acc
      <<h::size(4), t::bitstring>> -> do_decode(t, acc ++ [decode_nucleotide(h)])
    end
  end
end
