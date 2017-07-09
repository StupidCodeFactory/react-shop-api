require "rails_helper"

RSpec.describe ShoppingBasket, :product_setup, :delivery_charge_setup  do
  subject { described_class.new(products, delivery_charges) }

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
  end
end
