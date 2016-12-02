def sign_up
  visit('/users/new')
  fill_in("email", :with => "dinespoulsen84@gmail.com")
  fill_in("password", :with => "test")
  click_button("Create user")
end
