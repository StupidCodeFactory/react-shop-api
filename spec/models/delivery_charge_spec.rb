require 'rails_helper'

RSpec.describe DeliveryCharge, type: :model do

  let(:valid_attributes) { { amount_in_cents: 495, price_range: 0..50 }  }
  subject { described_class.create!(valid_attributes) }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_numericality_of(:amount_in_cents).is_greater_than_or_equal_to(0) }

  end
end
