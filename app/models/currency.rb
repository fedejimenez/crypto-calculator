# frozen_string_literal: true

class Currency < ApplicationRecord
  def current_price
    headers = {
      'X-CMC_PRO_API_KEY': ENV['API_KEY_COINMARKETCAP']
    }

    url_api_path = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/'
    url_endpoint = "quotes/latest?slug=#{slug}"

    url = url_api_path + url_endpoint

    request = HTTParty.get(url,
                           'Content-Type': 'application/json',
                           headers: headers)

    response = JSON.parse(request.body)
    coin_id = get_id(response.dig('data')).first
    response.dig('data', coin_id, 'quote', 'USD', 'price')
  end

  def get_id(data)
    data.keys
  end
end
