# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['secret_user'], password: ENV['secret_password']
  def show
    @categories_count = Category.order(id: :desc).all.count
    @products_count = Product.order(id: :desc).all.count
  end
end
