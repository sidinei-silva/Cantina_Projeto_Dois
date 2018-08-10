class ApplicationController < ActionController::Base
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  if defined? (session[:carrinho].count)
    @quantidade_carrinho = session[:carrinho].count
  end


  def resource_name
    :cliente
  end

  def resource
    @resource ||= Cliente.new
  end

  def resource_class
    Cliente
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:cliente]
  end

end
