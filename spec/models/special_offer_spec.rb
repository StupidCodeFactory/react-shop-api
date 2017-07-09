require "rails_helper"

RSpec.describe SpecialOffer, :product_setup do

  subject { described_class.new(rule, product_processor) }


  let(:rule) do
    -> (products) do
      products.size == 2
    end
  end

  let(:product_processor) do
    -> (products) do
      products[-1].price_in_cents / 2.0
    end
  end

  let(:basket_items) { [] }

  describe '#price_for' do
    context 'Given a rule and a product_processor' do
      context 'And the rule is not yet fullfiled' do

        it 'returns the orinal price' do
          expect(subject.price_for(jeans)).to eq(jeans.price_in_cents)
        end

        context 'when the rule is fulfilled' do
          before do
            subject.price_for(jeans)
          end

          it 'applies the discount' do
            expect(subject.price_for(jeans)).to eq(jeans.price_in_cents / 2.0)
          end

          context'when price_foring more products' do
            before do
              subject.price_for(jeans)
            end

            it 'returns the original price' do
              expect(subject.price_for(jeans)).to eq(jeans.price_in_cents)
            end

            context 'and when the rule is fulfilled again' do
              before do
                subject.price_for(jeans)
              end

              it 'applies the discount again' do
                expect(subject.price_for(jeans)).to eq(jeans.price_in_cents / 2.0)
              end

            end
          end
        end

      end
    end
  end

end
