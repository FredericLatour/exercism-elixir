defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    get_path(data, String.split(path, "."))
  end

  defp get_path(data, path_list) do
    case path_list do
      [] -> data
      [h | t] -> get_path(data[h], t)
    end
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
