#why is last_response is undefined
require 'rails_helper'

describe SessionsController do

  describe "GET /sessions/new" do
    it "renders user signin form" do
      new_session_path
      expect(last_response).to be_ok
    end
  end

  #How can i specify that i want this to run the 'destroy' method?
  describe "POST /session/3" do
    it "logs users out" do
      session_path(3)
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

end