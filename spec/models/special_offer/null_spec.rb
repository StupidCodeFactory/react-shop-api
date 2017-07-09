require "rails_helper"

RSpec.describe SpecialOffer::Null, :product_setup do

  describe '#price_for' do
    it 'always a product price' do
      expect(subject.price_for(jeans)).to eq(jeans.price_in_cents)
    end
  end
end
