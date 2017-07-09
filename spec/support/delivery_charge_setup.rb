RSpec.shared_context "delivery charges setup" do
  let(:under_fifty) { DeliveryCharge.create! amount_in_cents: 495, price_range: 0..4900 }
  let(:between_fifty_and_ninety) { DeliveryCharge.create! amount_in_cents: 295, price_range: 5000..9000 }

  let(:delivery_charges) { [under_fifty, between_fifty_and_ninety] }
end
