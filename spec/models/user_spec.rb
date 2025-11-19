require 'rails_helper'
RSpec.describe User, type: :model do
  it "is valid with a name and email" do
    user = User.new(name: "John Doe", email: "john.doe@example.com")
    expect(user).to be_valid
  end
end
