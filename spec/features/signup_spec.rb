require 'spec_helper'

feature "signing up" do
  scenario "A user will be able to signup" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome test@test.com")
    expect(User.first.email).to eq("test@test.com")
  end

  scenario "A user will not be able to sign in without correct password" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content("Password and confirmation password do not match")
  end

  scenario "A user will not be able to sign in with no email address" do
    expect{ sign_up(email: '')}.not_to change(User, :count)
  end

  scenario "A user will not be able to submit an invalid email" do
    expect{ sign_up(email: 'invalid@email')}.not_to change(User, :count)
  end

end
