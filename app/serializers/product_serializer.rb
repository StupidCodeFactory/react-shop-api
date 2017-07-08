class ProductSerializer < ActiveModel::Serializer
  attribute :name
  attribute :code
  attribute :price

  def price
    @price ||= object.price_in_cents * 0.01
  end
end
