# frozen_string_literal: true

class Currency < ApplicationRecord
  API_BASE_URL = ENV['API_BASE_URL']

  # Calculate the value based off the assets current price and the amount owned
  # @param amount [String] the amount a user owns
  def calculate_value(amount)
    (current_price.to_f * amount.to_f).round(4)
  end

  def current_price
    headers = {
      'X-CMC_PRO_API_KEY': ENV['API_KEY_COINMARKETCAP']
    }

    request = HTTParty.get(url,
                           'Content-Type': 'application/json',
                           headers: headers)

    response = JSON.parse(request.body)

    return unless response

    coin_id = get_id(response.dig('data')).first
    response.dig('data', coin_id, 'quote', 'USD', 'price')
  end

  def get_id(data)
    data.keys
  end

  # Structure the api endpoint for our request to get the current price.
  def url
    url_api_path = API_BASE_URL
    url_endpoint = "quotes/latest?slug=#{slug}"

    url_api_path + url_endpoint
  end
end
