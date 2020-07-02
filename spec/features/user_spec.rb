require 'rails_helper'

RSpec.feature 'User', type: :feature do
  before :each do
    @user = User.first
  end

  # it 'Should log in' do
  #   visit new_user_session_path
  #   fill_in 'Email', with: @user.email
  #   fill_in 'Password', with: @user.password
  #   click_button 'commit'
  #   # click_on 'Events'
  #   # click_on 'New event'
  #   # fill_in 'title', with: 'New Event'
  #   # fill_in 'description', with: 'Some Description'
  #   # fill_in 'date', with: '20.07.2020'
  #   # click_button 'commit'
  #   expect(page).to have_content('Recent posts')
  #   # expect(page).to have_content('Creator')
  # end

  it 'Should sign up' do
    visit new_user_registration_path
    fill_in 'Name', with: 'administrator'
    fill_in 'Email', with: 'adm@admin.com'
    fill_in 'Password', with: 'administrator'
    fill_in 'Password confirmation', with: 'administrator'
    click_button 'commit'
    expect(page).to have_content('Recent posts')
  end
end
