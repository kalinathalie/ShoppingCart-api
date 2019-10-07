# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  post '/new_cart', to: 'auths#create'
  post '/cart/update', to: 'purchases#update_cart'
  post '/cart/add_coupon', to: 'purchases#add_coupon'
  post '/cart/finish', to: 'purchases#finish'
end
