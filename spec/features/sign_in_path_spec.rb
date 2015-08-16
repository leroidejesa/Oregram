require 'rails_helper'

describe 'sign in form path' do
  it 'validates user and password' do
    user = FactoryGirl.create :user
    visit 'users/sign_in'
    fill_in 'Password', with: user.password
    fill_in 'Email', with: user.email
    click_on 'Log in'
    expect(page).to have_content user.name
  end
end
