defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ [maximum_price: 100]) do
    max_price = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bottom <- bottoms,
        top.price + bottom.price <= max_price and top.base_color != bottom.base_color do
      {top, bottom}
    end
  end
end
