# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConverter do
  describe '.convert_to_eur' do
    context 'when converting from USD to EUR' do
      it 'converts correctly' do
        expect(CurrencyConverter.convert_to_eur(113, 'USD')).to eq(100.0)
      end
    end

    context 'when converting from TYR to EUR' do
      it 'converts correctly' do
        expect(CurrencyConverter.convert_to_eur(3.31, 'TYR')).to eq(1.0)
      end
    end

    context 'when converting from SEK to EUR' do
      it 'converts correctly' do
        expect(CurrencyConverter.convert_to_eur(11.32, 'SEK')).to eq(1.0)
      end
    end

    context 'when converting from an unsupported currency' do
      it 'treats the rate as 1.0' do
        expect(CurrencyConverter.convert_to_eur(100, 'XYZ')).to eq(100.0)
      end
    end

    context 'when converting with non-numeric amount' do
      it 'converts the amount to float before conversion' do
        expect(CurrencyConverter.convert_to_eur('100', 'USD')).to eq(88.4956)
      end
    end
  end
end
