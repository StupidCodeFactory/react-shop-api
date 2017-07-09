require "rails_helper"

RSpec.describe LineItemSerializer, :product_setup do
  let(:checkout)  { Checkout.create! }
  let(:line_item) { checkout.line_items.create(product: jeans) }

  subject { described_class.new(line_item) }

  it { expect(subject.as_json).to eq(
                                    product_id: jeans.id, checkout_id: checkout.id ) }
end
