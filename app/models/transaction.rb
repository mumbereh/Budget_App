class Transaction < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true
end
