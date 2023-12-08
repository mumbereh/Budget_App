require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'm', email: 'm@gmail.com') }

  before { subject.save }

  it 'name should be present' do
    expect(subject.name).to eq('m')
  end

  it 'email should be present' do
    expect(subject.email).to eq('m@gmail.com')
  end
end
