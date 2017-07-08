require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:products) do
    [
      { 'name' => 'Jeans',  'code' => 'JO1', 'price' => 32.95 },
      { 'name' => 'Blouse', 'code' => 'JO1', 'price' => 24.95 },
      { 'name' => 'Socks',  'code' => 'JO1', 'price' => 7.95  }
    ]
  end
  describe 'GET /index' do
    let(:json_parsed_response) { JSON.parse(response.body)  }
    it "returns the list of products" do
      get :index
      expect(json_parsed_response).to eq(products)
    end
  end
end
