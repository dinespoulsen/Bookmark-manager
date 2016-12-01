require 'spec_helper'

feature "signing up" do
  scenario "A user will be able to signup" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome test@test.com")
    expect(User.first.email).to eq("test@test.com")
  end

  scenario "A user will not be able to sign in" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content("Password and confirmation password do not match")
  end

end
