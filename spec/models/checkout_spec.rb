require "rails_helper"

RSpec.describe Checkout do
  it { is_expected.to have_many(:line_items) }
  it { is_expected.to have_many(:products).through(:line_items) }
end
