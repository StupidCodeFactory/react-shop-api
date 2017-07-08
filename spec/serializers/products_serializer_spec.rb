require 'rails_helper'

RSpec.describe ProductsSerializer do
  let(:products_attributes) do
    [
      { name: 'Jeans',  code: 'JO1', price_in_cents: 3295 },
      { name: 'Blouse', code: 'JO1', price_in_cents: 2495 },
      { name: 'Socks',  code: 'JO1', price_in_cents: 795  }
    ]
  end

  let(:products) do
    products_attributes.map { |product| Product.create! product }
  end

  subject { ProductsSerializer.new(products) }

  it 'has serialized the product prices correctly' do
    expect(subject.as_json).to eq(
      [
        { name: 'Jeans',  code: 'JO1', price: 32.95 },
        { name: 'Blouse', code: 'JO1', price: 24.95 },
        { name: 'Socks',  code: 'JO1', price: 7.95  }
      ]
    )
  end
end
