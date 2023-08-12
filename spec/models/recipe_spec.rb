require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'tails-tester') }
  subject do
    Recipe.new(name: 'Ruby on rails', preparation_time: 1, cooking_time: 2, public: true, user_id: user.id,
               description: 'This is a sample decription')
  end

  it 'Public should not take not boolean values' do
    subject.public = 'true'
    expect(subject).to_not be_valid

    subject.public = 'false'
    expect(subject).to_not be_valid
  end

  it 'Name should be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Preparation_time value should be greater than 0 ' do
    subject.preparation_time = 0
    expect(subject).to_not be_valid

    subject.preparation_time = -5
    expect(subject).to_not be_valid
  end

  it 'Cooking_time should be greater than 0' do
    subject.cooking_time = 0
    expect(subject).to_not be_valid

    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end
end
