# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index; end

  def search
    render json: { currencies: currencies }
  end

  # Takes in the currency id and amount owned
  # Returns final calculation
  def calculate
    amount = params[:amount]

    render json: {
      currency: currency,
      current_price: currency.current_price,
      amount: amount,
      value: currency.calculate_value(amount)
    }
  end

  private

  def currency
    @currency ||= Currency.find_by(id: params[:id])
  end

  def currencies
    @currencies ||= Currency.where('LOWER(name) LIKE ?',
                                   "%#{params[:search].downcase}%")
  end
end
