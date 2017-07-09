require 'rails_helper'

RSpec.describe DeliveryCharge, type: :model do

  let(:valid_attributes) { { amount_in_cents: 495, price_range: 0..50 }  }
  subject { described_class.create!(valid_attributes) }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_numericality_of(:amount_in_cents).is_greater_than_or_equal_to(0) }

    describe 'Given a delivery charge exists for a price range between 0 and 1000' do

      let!(:existing_delivery_charge) { described_class.create! valid_attributes }

      context 'When creating a delivery charge with an overlapping range' do
        it 'is expected to raise an error' do
          expect { subject }.to raise_error(ActiveRecord::StatementInvalid)
        end
      end
    end
  end
end
