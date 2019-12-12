class Admin::DashboardController < ApplicationController
  def show
    @product = Product.order(id: :desc).count
    @category = Category.order(id: :desc).count
  end
end
