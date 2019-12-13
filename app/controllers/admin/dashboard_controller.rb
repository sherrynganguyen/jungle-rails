class Admin::DashboardController < Admin::BaseAdminController
  def show
    @product = Product.order(id: :desc).count
    @category = Category.order(id: :desc).count
  end
end
