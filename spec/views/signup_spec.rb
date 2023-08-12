require 'rails_helper'
require_relative '../test_helper'

RSpec.describe 'Sign up', type: :view do
  before do
    create_user('test')
    visit('/')
  end

  it 'User can not register with existing email' do
    click_link 'Sign up'
    fill_in 'Name', with: 'tails-tester'
    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '0000000'
    fill_in 'Password confirmation', with: '0000000'
    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end

  it 'User can not register with a weak password' do
    click_link 'Sign up'
    fill_in 'Name', with: 'tails-tester'
    fill_in 'Email', with: 'test2@mail.com'
    fill_in 'Password', with: '00'
    fill_in 'Password confirmation', with: '00'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short'
  end

  it 'User can register with unique email' do
    click_link 'Sign up'
    fill_in 'Name', with: 'tails-tester'
    fill_in 'Email', with: 'test3@mail.com'
    fill_in 'Password', with: '0000000'
    fill_in 'Password confirmation', with: '0000000'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
