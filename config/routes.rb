Rails.application.routes.draw do
  resources :products
  resources :checkouts, only: :create do
    resources :line_items, only: [:create, :destroy]
  end
end
