require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Users', type: :feature do
  before(:each) do
    visit signup_path
    within('form') do
      fill_in 'Name', with: 'user1'
      fill_in 'Password', with: 135_792_468
    end
    click_button 'Create my account'
  end

  it 'Redirects user to user page for the first time' do
    expect(page).to have_content('The Transaction App was built by Aye Daniel Asoo')
  end
end
