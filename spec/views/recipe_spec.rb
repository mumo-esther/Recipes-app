require 'rails_helper'
require_relative '../test_helper'

RSpec.describe 'Recipes', type: :view do
  before do
    create_recipe('Rolex')
  end

  it 'Should add a recipe from recipes page' do
    click_link 'Recipe List'
    click_link 'New recipe'
    fill_in 'Name', with: 'Matooke'
    fill_in 'Description', with: 'Chappti and eggs'
    fill_in 'Cooking time', with: 2
    fill_in 'Preparation time', with: 1
    check('Public', allow_label_click: true)
    click_button 'Create Recipe'
    expect(page).to have_content('Matooke')
    expect(page).to have_content('2')
    expect(page).to have_content('Add ingredient')
    expect(page).to have_content('Public')
    expect(page).to have_css(".form-check-input.success[checked='checked']")
    expect(page).to have_content('General shopping list')
  end

  it 'contains cooking time' do
    click_link 'Recipe List'
    click_link 'Show this recipe'
    expect(page).to have_content('Rolex')
    expect(page).to have_content('Cooking time')
  end

  it 'should genrate the shoping list' do
    click_link 'Recipe List'
    click_link 'Show this recipe'
    click_link 'General shopping list'
    expect(page).to have_content('Food Quantity Price')
  end

  it 'Should only show public recipes' do
    user = create_user('sample')
    Recipe.create(name: 'Banana', public: false, preparation_time: 3, cooking_time: 2, user_id: user.id)
    Recipe.create(name: 'Apple', public: true, preparation_time: 3, cooking_time: 2, user_id: user.id)
    visit('/public_recipes')

    expect(page).not_to have_content('Banana')
    expect(page).to have_content('Apple')
    expect(page).to have_content('By sample')
  end

  it 'Recipe owner should manager their own recipe' do
    user = create_user('Sample')
    user2 = create_user('Diana')
    recipe = Recipe.create(name: 'Banana', public: false, preparation_time: 3, cooking_time: 2, user_id: user.id)

    visit destroy_user_session_path
    login_user(user2)
    visit("/recipes/#{recipe.id}")
    expect(page).to have_content('Banana')
    expect(page).not_to have_content('Add ingredient')

    visit destroy_user_session_path
    login_user(user)
    visit("/recipes/#{recipe.id}")
    expect(page).to have_content('Banana')
    expect(page).to have_content('Add ingredient')
  end
end
