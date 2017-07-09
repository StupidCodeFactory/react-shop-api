class DeliveryCharge < ApplicationRecord
  validates_numericality_of :amount_in_cents, greater_than_or_equal_to: 0

end
