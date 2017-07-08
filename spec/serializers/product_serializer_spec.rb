require "rails_helper"

RSpec.describe ProductSerializer do

  let(:product) do
    Product.create!(name: 'Socks',  code: 'JO1', price_in_cents: 795)
  end

  subject { ProductSerializer.new(product) }

  it 'has serialized the product prices correctly' do
    expect(subject.as_json).to eq(
                                 { name: 'Socks',  code: 'JO1', price: 7.95  }
                               )
  end
end
