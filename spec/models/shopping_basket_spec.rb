require "rails_helper"

RSpec.describe ShoppingBasket, :product_setup  do

  describe '#total' do
    context 'Given one pair of socks and a blouse' do
      it {
        expect(subject.total).to eq(37.85)
      }
    end
  end
end
