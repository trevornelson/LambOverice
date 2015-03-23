require 'rails_helper'
require 'pp'

describe UsersController do

  let(:user) {User.create(username: "leoarogers", email: "leo.a.rogers@gmail.com", password: "1234")}

  describe "GET /users/new " do
    it "loads user creation form" do
      new_user_path
      expect(response).to be_ok
    end
  end

end