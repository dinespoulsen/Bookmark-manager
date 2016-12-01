require 'spec_helper'

feature "signing up" do
  scenario "A user will be able to signup" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome test@test.com")
    expect(User.first.email).to eq("test@test.com")
  end
end
