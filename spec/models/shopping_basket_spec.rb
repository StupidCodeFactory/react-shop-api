require "rails_helper"

RSpec.describe ShoppingBasket, :product_setup, :delivery_charge_setup  do
  let(:special_offer_catalogue) do
    {
      jeans.code => SpecialOffer.new(
        -> (products) { products.size == 2 },
        -> (products) { products[-1].price_in_cents / 2.0 }
      )
    }
  end

  subject { described_class.new(products, delivery_charges, special_offer_catalogue) }

  describe '#total' do
    context 'Given one no products' do
      it { expect(subject.total).to eq(0) }
    end

    context 'Given one pair of socks and a blouse' do
      before do
        subject.add(socks.code)
        subject.add(blouse.code)
      end

      it { expect(subject.total).to eq(37.85) }
    end

    context 'Given two pairs of jeans' do
      before do
        subject.add(jeans.code)
        subject.add(jeans.code)
      end

      it { expect(subject.total).to eq(54.37) }
    end

    context 'Given a pairs of jeans and a blouse' do
      before do
        subject.add(jeans.code)
        subject.add(blouse.code)
      end

      it { expect(subject.total).to eq(60.85) }

    end

    context 'Given to pairs of socks and 3 pairs of jeans' do
      before do
        subject.add(socks.code)
        subject.add(socks.code)
        subject.add(jeans.code)
        subject.add(jeans.code)
        subject.add(jeans.code)
      end

      it { expect(subject.total).to eq(98.27) }
    end
  end
end
