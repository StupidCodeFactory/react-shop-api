require "rails_helper"

RSpec.describe CheckoutsController do
  describe 'POST #create' do
    it 'creates a checkout' do
      expect {
        post :create
      }.to change { Checkout.count }.by(1)
    end
  end
end
