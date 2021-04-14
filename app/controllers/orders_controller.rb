class OrdersController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
  end

end