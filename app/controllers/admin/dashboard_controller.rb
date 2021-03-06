class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'].to_s, password: ENV['AUTH_PASSWORD'].to_s
  
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
