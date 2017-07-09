RSpec.shared_context "products setup" do

  let!(:jeans)  { Product.create! name: 'Jeans',  code: 'J01', price_in_cents: 3295  }
  let!(:blouse) { Product.create! name: 'Blouse', code: 'B01', price_in_cents: 2495 }
  let!(:socks)  { Product.create! name: 'Socks',  code: 'S01', price_in_cents: 795  }

  let(:products) do
    [jeans, blouse, socks]
  end

end
