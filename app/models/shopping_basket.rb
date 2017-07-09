require 'securerandom'

class ShoppingBasket

  def initialize(products, delivery_charges, special_offer_catalogue)
    self.delivery_charges        = delivery_charges
    self.special_offer_catalogue = special_offer_catalogue
    self.basket_items            = {}
    self.product_catalogue       = products.each_with_object({}) do |product, catalogue|
      catalogue[product.code] = product
    end
  end

  def add(product_code)
    product       = product_catalogue[product_code]
    special_offer = check_for_offer_on(product)

    basket_items[SecureRandom.uuid] = {
      product:        product,
      price_in_cents: special_offer.price_for(product)
    }
  end

  def total
    return 0.0 if basket_items.empty?
    ((products_total_amount + delivery_charge_amount) * 0.01).floor(2)
  end

  private
  attr_accessor :product_catalogue, :delivery_charges, :special_offer_catalogue, :basket_items

  def products_total_amount
    basket_items.values.map {|line_item| line_item[:price_in_cents]}.reduce(:+) || 0
  end

  def delivery_charge_amount
    delivery_charges.detect do |delivery_charge|
      delivery_charge.price_range.include?(products_total_amount)
    end&.amount_in_cents || 0
  end

  def check_for_offer_on(product)
    return SpecialOffer::Null.new unless special_offer_catalogue.key?(product.code)
    special_offer_catalogue[product.code]
  end
end
