# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['secret_user'], password: ENV['secret_password']
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
