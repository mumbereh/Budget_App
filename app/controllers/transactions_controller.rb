# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: %i[index show]

  def index
    load_transactions_and_total_amount
  end

  def show
    @transaction = Transaction.find(params[:id])
    @category = @transaction.category
  end

  def new
    build_new_transaction
  end

  def create
    build_new_transaction
    save_transaction
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def load_transactions_and_total_amount
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def build_new_transaction
    @transaction = @category.transactions.build
  end

  def save_transaction
    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully!'
    else
      render :new
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
