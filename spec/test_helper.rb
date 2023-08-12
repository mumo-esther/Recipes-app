def create_user(user = 'test-user-1')
  User.create(name: user, email: "#{user}@mail.com", password: '0000000')
end

def login_user(user)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: '0000000'
  click_button 'Log in'
end

def create_login_user(user)
  @user = create_user(user)
  visit('/')
  login_user(@user)
end

def create_recipe(name = 'Rolex')
  @user = create_user
  visit('/')
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: '0000000'
  click_button 'Log in'

  click_link 'Recipe List'
  click_link 'New recipe'
  fill_in 'Name', with: name
  fill_in 'Description', with: 'Chappti and eggs'
  fill_in 'Cooking time', with: 2
  fill_in 'Preparation time', with: 1
  check('Public', allow_label_click: true)
  click_button 'Create Recipe'
end

def create_food(name = 'Test name')
  visit new_food_path

  fill_in 'Name', with: name
  fill_in 'Measurement unit', with: 'unit'
  fill_in 'Quantity', with: 10
  fill_in 'Price', with: 5
  click_button 'Create Food'
  expect(page).to have_content('Food was successfully created.')
  expect(page).to have_content(name)
  expect(page).to have_content('10')
  expect(page).to have_content('5')
  expect(page).to have_content('unit')
end
