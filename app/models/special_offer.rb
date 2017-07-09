class SpecialOffer

  NOOP_RULE = -> (product) { product.price_in_cents }

  def initialize(product, &block)
    self.product = product
    self.rule = block || NOOP_RULE
  end

  def price_in_cents
    rule.call(product)
  end

  private
  attr_accessor :product, :rule
end
