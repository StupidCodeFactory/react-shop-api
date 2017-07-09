RSpec.shared_context "products setup" do

  let!(:jeans)  { Product.create! name: 'Jeans',  code: 'JO1', price_in_cents: 3295  }
  let!(:blouse) { Product.create! name: 'Blouse', code: 'BO1', price_in_cents: 2495 }
  let!(:socks)  { Product.create! name: 'Socks',  code: 'SO1', price_in_cents: 795  }

  let(:products) do
    [jeans, blouse, socks]
  end

end
