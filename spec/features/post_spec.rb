require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(name: 'User', email: 'user@mail.com', password: 'asdqwe')
  end

  it 'Should create a post' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@mail.com'
    fill_in 'Password', with: 'asdqwe'
    click_button 'commit'
    expect(page).to have_content('Recent posts')
    fill_in 'post[content]', with: 'This is a test post. Please Ignore!'
    click_button 'commit'
    expect(page).to have_content('This is a test post. Please Ignore!')
  end
end
