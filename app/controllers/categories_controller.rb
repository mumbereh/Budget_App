# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_category, only: [:show, :destroy, :transactions]

  def index
    @categories = Category.all
    calculate_total_amount
  end

  def show
    @transactions = @category.transactions
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    save_category
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  def transactions
    @transactions = @category.transactions
    @total_amount = @transactions.sum(:amount)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def calculate_total_amount
    @categories.each do |category|
      category.total_amount = category.transactions.sum(:amount)
    end
  end

  def save_category
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
