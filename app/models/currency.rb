# frozen_string_literal: true

class Currency < ApplicationRecord
  def fetch_coins_list
    url_API = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

    query = {
      'start':'1',
      'limit':'200'
    }

    headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': ENV['API_KEY_COINMARKETCAP']
    }

    request = HTTParty.get(url_API, query: query, headers: headers)
    response = JSON.parse(request.body)

    if response['status']['error_code'].zero?
      @coins_list = response['data']
    else
      @coins_list = []
      # return response['status']['error_message']
    end
  end

  def current_price_usd
    fetch_coins_list

    @coin_data = @coins_list.select {|coin| coin["symbol"] == self.currency_symbol }

    @coin_data[0]['quote']['USD']['price']
  end

  def calculate_value(amount)
    (current_price_usd.to_f * amount.to_f).round(4)
  end
end
