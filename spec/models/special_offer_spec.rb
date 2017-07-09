require "rails_helper"

RSpec.describe SpecialOffer, :product_setup do

  subject { described_class.new(jeans, &rule) }

  describe '#amount_in_cents' do
    context 'Given a no pricing rule' do
      let(:rule) { nil }
      it 'does not modify a product price' do
        expect(subject.price_in_cents).to eq(jeans.price_in_cents)
      end
    end

    describe 'Give a rule' do

      let(:rule) { -> (product) { product.price_in_cents / 2.0 } }

      it 'applies the rule' do
        expect(subject.price_in_cents).to eq(jeans.price_in_cents / 2.0)
      end
    end
  end

end
