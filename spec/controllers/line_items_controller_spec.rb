require "rails_helper"

RSpec.describe LineItemsController, :product_setup do

  let!(:checkout) { Checkout.create! }

  describe 'POST #create' do
    it 'adds a line items to the checkout' do
      expect {
        post :create, params: { checkout_id: checkout.id, line_items: { product_id: socks.id } }
      }.to change { checkout.products.count  }.from(0).to(1)
      print
    end

    it 'returns a line items' do
      post :create, params: { checkout_id: checkout.id, line_items: { product_id: socks.id } }
      expect(JSON.parse(response.body)).to eq('data' => {
                                                'id' => checkout.line_items.first.id,
                                                'type' => 'line-items',
                                                'attributes' => {
                                                  'product-id' => socks.id, 'checkout-id' => checkout.id}
                                              }
                                             )
    end
  end

  describe 'DELETE #destroy' do
    let!(:line_item) { checkout.line_items.create!(product: blouse)  }

    it 'removes the poduct from the checkout' do
      expect {
        delete :destroy, params: { checkout_id: checkout.id, id: line_item.id }
      }.to change { checkout.products.count  }.from(1).to(0)
    end
  end
end
