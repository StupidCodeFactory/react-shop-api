class SpecialOffer::Null
  def price_for(product)
    product.price_in_cents
  end
end
