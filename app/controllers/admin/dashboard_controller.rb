class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @product = Product.order(id: :desc).count
    @category = Category.order(id: :desc).count
  end
end
