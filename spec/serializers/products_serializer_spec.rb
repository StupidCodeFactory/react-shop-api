require 'rails_helper'

RSpec.describe ProductsSerializer, :product_setup do

  subject { ProductsSerializer.new(products) }

  it 'has serialized the product prices correctly' do
    expect(subject.as_json).to eq(
      [
        { name: 'Jeans',  code: 'JO1', price: 32.95 },
        { name: 'Blouse', code: 'BO1', price: 24.95 },
        { name: 'Socks',  code: 'SO1', price: 7.95  }
      ]
    )
  end
end
