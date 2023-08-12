require 'rails_helper'
require_relative '../test_helper'

RSpec.describe 'Foods', type: :request do
  before do
    visit('/')
    create_login_user('tails-tester')
  end
  it 'has a button to add a new food' do
    click_link 'Food List'
    expect(page).to have_content('New food')
  end
  it 'displays a new food form' do
    visit new_food_path

    expect(page).to have_selector('form')
    expect(page).to have_field('food_name')
    expect(page).to have_field('food_measurement_unit')
    expect(page).to have_field('food_quantity')
    expect(page).to have_field('food_price')
    expect(page).to have_button('Create Food')
  end

  it 'can create a new food' do
    visit new_food_path

    fill_in 'Name', with: 'Tuna'
    fill_in 'Measurement unit', with: 'unit'
    fill_in 'Quantity', with: 10
    fill_in 'Price', with: 5
    click_button 'Create Food'
    expect(page).to have_content('Food was successfully created.')
    expect(page).to have_content('Tuna')
    expect(page).to have_content('10')
    expect(page).to have_content('5')
    expect(page).to have_content('unit')
  end

  it 'Can show created or added foods' do
    click_link 'Food List'
    click_link 'New food'
    fill_in 'Name', with: 'Potato'
    fill_in 'Measurement unit', with: 'unit'
    fill_in 'Quantity', with: 10
    fill_in 'Price', with: 5
    find('.btn.btn-outline-dark').click
    expect(page).to have_content('Potato')
    expect(page).to have_content('10')
    expect(page).to have_content('5')
    expect(page).to have_content('unit')
  end

  it 'Can destroy a food' do
    create_food('Rice')
    visit foods_path

    all('.btn.btn-outline-danger').first.click
    expect(page).to have_current_path(foods_path)
    expect(page).to have_content('Food was successfully destroyed')
  end
end
