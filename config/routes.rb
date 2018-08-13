Rails.application.routes.draw do

  root 'catalogo#index'
  get 'catalogo/index'
  get 'catalogo/detalhes'
  get 'carrinho/index'
  post 'carrinho/index'

  resources :pedido
  resources :item_pedidos
  resources :item_acompanhamentos
  devise_for :clientes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
