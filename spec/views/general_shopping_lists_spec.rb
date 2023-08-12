require 'rails_helper'
require_relative '../test_helper'

RSpec.describe 'GeneralShoppingLists', type: :view do
  before do
    visit('/')
    create_login_user('tails-tester')
  end

  it 'Can display the general shopping list view' do
    click_link 'Recipe List'
    click_link 'New recipe'
    fill_in 'Name', with: 'Pasta'
    fill_in 'Description', with: 'description on how to make pasta'
    fill_in 'Cooking time', with: 2
    fill_in 'Preparation time', with: 2
    click_button 'Create Recipe'

    expect(page).to have_content('Pasta')
    expect(page).to have_content('2')
    expect(page).to have_content('Add ingredient')
    expect(page).to have_content('General shopping list')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
    expect(page).to have_content('Actions')

    click_link 'General shopping list'
    expect(page).to have_content('Total price:')
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Number of items in the shopping list:')
    expect(page).not_to have_content('Actions')
    expect(page).to have_content('Food')
    expect(page).not_to have_content('Value')
  end
end
