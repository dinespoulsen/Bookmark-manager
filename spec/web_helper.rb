def sign_up
  visit('/names/new')
  expect(page.status_code).to eq 200
  fill_in("email", :with => "test@test.com")
  fill_in("password", :with =>"test")
  click_button("Sign Up")
end
