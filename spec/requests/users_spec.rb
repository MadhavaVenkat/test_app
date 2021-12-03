require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET /users" do
    it "To list the users" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Post /users" do
    before do
      @user = User.create({:firstname => "mahesh", :lastname => "babu", :email => "maheshbabu@gmail.com"})
    end

    it "To create the users" do
      expect(@user).to be_valid
    end
  end

  describe "Put /users" do
    before do
      @user = User.create({:firstname => "mahesh", :lastname => "babu", :email => "maheshbabu@gmail.com"})
      @user.firstname = "mahesh gatam"
    end

    it "To Update the users" do
      expect(@user).to be_valid
    end
  end
end
