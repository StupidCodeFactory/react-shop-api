class ShoppingBasket

  def initialize(products, delivery_charges)
    self.delivery_charges = delivery_charges
    self.product_codes    = []
    self.catalogue = products.each_with_object({}) do |product, catalogue|
      catalogue[product.code] = product
    end
  end

  def add(product_code)
    product_codes << product_code
  end

  def total
    return 0.0 if product_codes.empty?
    (products_total_amount + delivery_charge_amount) * 0.01
  end

  private
  attr_accessor :product_codes, :catalogue, :delivery_charges

  def products_total_amount
    product_codes.map do |code|
      catalogue[code].price_in_cents
    end.reduce(:+) || 0
  end

  def delivery_charge_amount
    delivery_charges.detect do |delivery_charge|
      delivery_charge.price_range.include?(products_total_amount)
    end&.amount_in_cents || 0
  end
end
