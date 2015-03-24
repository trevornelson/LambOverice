require 'rails_helper'
require 'pp'

describe UsersController do

  # don't leave in confusing behavior, because it confuses me.  di dyou mean to
  # send in these parameters? Or did you forget?  Or did that test once exist
  # and exists no more?  What's up?
  let(:user) {User.create(username: "leoarogers", email: "leo.a.rogers@gmail.com", password: "1234")}

  describe "GET /users/new " do
    it "loads user creation form" do
      new_user_path
      expect(response).to be_ok
    end
  end

end
