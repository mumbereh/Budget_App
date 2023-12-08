require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before :each do
    @transaction = Transaction.new(name: 'cow', amount: 50)
  end

  it 'name should be present' do
    expect(@transaction.name).to eq('cow')
  end

  it 'amount should be present' do
    expect(@transaction.amount).to eq(50)
  end
end
