def sign_up
  visit('/users/new')
  fill_in("email", :with => "dinespoulsen84@gmail.com")
  fill_in("password", :with => "test")
  fill_in("password_confirmation", :with => "test")
  click_button("Create user")
  # require 'pry'; binding.pry
end

def incorrect_sign_in
  visit('/users/new')
  fill_in("email", :with => "dinespoulsen84@gmail.com")
  fill_in("password", :with => "test")
  fill_in("password_confirmation", :with => "tst")
  click_button("Create user")
end

def blank_email_address
  visit('/users/new')
  fill_in("email", :with => "")
  fill_in("password", :with => "test")
  fill_in("password_confirmation", :with => "test")
  click_button("Create user")
end

def invalid_email_address
  visit('/users/new')
  fill_in("email", :with => "sdfdasgafdh")
  fill_in("password", :with => "test")
  fill_in("password_confirmation", :with => "test")
  click_button("Create user")
end
