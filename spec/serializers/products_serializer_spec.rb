require 'rails_helper'

RSpec.describe ProductsSerializer, :product_setup do

  subject { ProductsSerializer.new(products) }

  it 'has serialized the product prices correctly' do
    expect(subject.as_json).to eq(
      [
        { name: 'Jeans',  code: 'J01', price: 32.95 },
        { name: 'Blouse', code: 'B01', price: 24.95 },
        { name: 'Socks',  code: 'S01', price: 7.95  }
      ]
    )
  end
end
