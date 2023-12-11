require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'sam', email: 'sam@gmail.com')
    @category = Category.new(name: 'cow', icon: 'cow.png', user_id: @user.id)
  end

  it 'name should be present' do
    expect(@category.name).to eq('cow')
  end

  it 'icon shold be present' do
    expect(@category.icon).to eq('cow.png')
  end
end
