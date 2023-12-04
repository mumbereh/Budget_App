# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  attribute :total_amount, :integer
end
