class HomeController < ApplicationController
  def index
    @productos = Product.disponible.orden_codigo
  end
end
