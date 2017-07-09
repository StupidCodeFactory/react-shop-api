class SpecialOffer

  def initialize(rule, product_processor)
    self.products          = []
    self.rule              = rule
    self.product_processor = product_processor
  end

  def price_for(product)
    products << product

    if fulfilled?
      price = product_processor.call(products)
      products.clear
      price
    else
      product.price_in_cents
    end
  end

  private

  def fulfilled?
    rule.call(products)
  end


  private
  attr_accessor :products, :rule, :product_processor
end
