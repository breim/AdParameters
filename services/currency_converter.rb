# frozen_string_literal: true

module CurrencyConverter
  module_function

  EXCHANGE_RATES = {
    'EUR' => 1.0,
    'USD' => 1.13,
    'TYR' => 3.31,
    'SEK' => 11.32
  }.freeze

  def convert_to_eur(amount, currency)
    rate = EXCHANGE_RATES.fetch(currency)
    (amount.to_f / rate).round(4)
  rescue KeyError
    raise "Currency not supported: #{currency}"
  end
end
