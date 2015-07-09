require 'rails_helper'

describe User do
  it { should validate_presence_of :email }

  it 'validates the presence of an email' do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq 'leroi@leroi.com'
  end
end
