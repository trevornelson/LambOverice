#why is last_response is undefined
require 'rails_helper'

describe UsersController do

  let(:user) {User.create(username: "leoarogers", email: "leo.a.rogers@gmail.com", password: "1234")}

  describe "GET /users/new " do
    it "loads user creation form" do
      get '/users/new'
      expect(last_response).to be_ok
    end
  end

end