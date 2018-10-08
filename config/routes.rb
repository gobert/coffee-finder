Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get 'find/coffee_shops' => 'search#coffee_shop'
  end
  get '_/error' => 'application#error'
end
