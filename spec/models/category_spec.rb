require 'rails_helper'
require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create(name: 'm', email: 'm@gmail.com')
    @category = Category.new(name: 'cow', icon: 'cow.png', user: @user)
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).not_to be_valid
  end

  it 'is not valid without an icon' do
    @category.icon = nil
    expect(@category).not_to be_valid
  end
end
