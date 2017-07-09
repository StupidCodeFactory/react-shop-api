class LineItemsController < ApplicationController
  def create
    line_item = checkout.line_items.create!(line_items_params)
    render json: line_item
  end

  def destroy
    checkout.line_items.find(params.require(:id)).destroy!
    head(:ok)
  end
  private

  def checkout
    @checkout ||= Checkout.find(params.require(:checkout_id))
  end

  def line_items_params
    params.require(:line_items).permit(:product_id)
  end
end
