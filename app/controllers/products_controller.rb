class ProductsController < ApplicationController

  DEFAULT_PER_PAGE = 50

  def index
    products = Product.all.page(page).per(DEFAULT_PER_PAGE)
    render json: products
  end

  def page
    params[:page] || 1
  end
end
