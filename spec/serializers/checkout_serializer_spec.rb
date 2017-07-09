require "rails_helper"

RSpec.describe CheckoutSerializer do
  let(:checkout) { Checkout.create }
  let(:expected_attributes) { :id }

  subject { CheckoutSerializer.new(checkout) }

  it 'has serialized the checkout correctly' do
    expect(subject.as_json).to eq(
      id: checkout.id
    )
  end

end
