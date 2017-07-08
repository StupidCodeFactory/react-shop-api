require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:products_attributes) do
    [
      { 'name' => 'Jeans',  'code' => 'JO1', 'price_in_cents' => 3295 },
      { 'name' => 'Blouse', 'code' => 'JO1', 'price_in_cents' => 2495 },
      { 'name' => 'Socks',  'code' => 'JO1', 'price_in_cents' => 795  }
    ]
  end

  let!(:products) do
    products_attributes.map { |product| Product.create! product }
  end

  describe 'GET /index' do
    let(:json_parsed_response) { JSON.parse(response.body) }
    it 'returns the list of products' do
      get :index
      expect(json_parsed_response).to eq('data' =>
                                         [
                                           {
                                             'id'         => products[0].id,
                                             'type'       => 'products',
                                             'attributes' => {
                                               'name' => 'Jeans',
                                               'code' => 'JO1',
                                               'price' => 32.95
                                             }
                                           },
                                           { 'id' => products[1].id,
                                             'type' => 'products',
                                             'attributes' => {
                                               'name' => 'Blouse',
                                               'code' => 'JO1',
                                               'price' => 24.95
                                             } },
                                           {
                                             'id' => products[2].id,
                                             'type' => 'products',
                                             'attributes' => {
                                               'name' => 'Socks',
                                               'code' => 'JO1',
                                               'price' => 7.95
                                             }
                                           }
                                         ],
                                         'links' => {})
    end
  end
end
