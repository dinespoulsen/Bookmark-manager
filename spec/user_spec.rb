require './app/models/user'

describe User do
  subject(:user) {described_class.new(email: "dinespoulsen84@gmail.com", password: "test", password_confirmation: "test")}

  it "should authenticate a user" do
    expect(user.authenticate?("test")).to be true
  end

  it "should reject a user" do
    expect(user.authenticate?("rest")).to be false
  end

end
