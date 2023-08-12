require 'rails_helper'
require_relative '../test_helper'

RSpec.describe 'Login', type: :view do
  before do
    create_user('test')
    visit('/')
  end

  it 'User can log in the page' do
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(current_path).to eq('/login')
  end

  it 'User can log in the page' do
    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '0000000'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'User can not log in the page with invalid credentials' do
    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '00000'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
end
