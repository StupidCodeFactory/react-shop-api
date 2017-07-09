RSpec.shared_context "products setup", shared_context: :metadata do
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

end
