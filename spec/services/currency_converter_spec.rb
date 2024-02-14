# frozen_string_literal: true

RSpec.describe CurrencyConverter do
  describe '.convert_to_eur' do
    it 'converts USD to EUR correctly' do
      expect(CurrencyConverter.convert_to_eur(113, 'USD')).to eq(100.0)
    end

    it 'converts TYR to EUR correctly' do
      expect(CurrencyConverter.convert_to_eur(3.31, 'TYR')).to eq(1.0)
    end

    it 'converts SEK to EUR correctly' do
      expect(CurrencyConverter.convert_to_eur(11.32, 'SEK')).to eq(1.0)
    end

    it 'returns the same amount for EUR to EUR conversion' do
      expect(CurrencyConverter.convert_to_eur(1, 'EUR')).to eq(1.0)
    end

    it 'handles conversion for unsupported currencies as EUR' do
      expect { CurrencyConverter.convert_to_eur(100, 'ABC') }.to raise_error('Currency not supported: ABC')
    end
  end
end
