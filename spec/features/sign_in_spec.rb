require 'spec_helper'

feature "When a user sign in" do

  scenario "A user can sign in" do
    sign_up
    visit('/sign-in')
    fill_in("email", :with =>"dinespoulsen84@gmail.com")
    fill_in("password", :with =>"test")
    click_button("Sign in")
    expect(page).to have_content("Welcome dinespoulsen84@gmail.com")
  end

  scenario "A user signs in with incorrect password" do
    sign_up
    visit('/sign-in')
    fill_in("email", :with =>"dinespoulsen84@gmail.com")
    fill_in("password", :with =>"rest")
    click_button("Sign in")
    expect(page).to have_content("Invalid password")
  end

end
