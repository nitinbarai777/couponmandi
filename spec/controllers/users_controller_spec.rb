require "spec_helper"

describe UsersController do

  describe "POST /users" do
    it "redirect and set flash notice" do
      user = {
        username:"nitin",
        password:"nitin",
        password_confirmation:"nitin"
      }
      post :create, user: user
      response.code.should eq("302")
      flash[:notice].should eq("User created.")
    end

    it "reset session[:user_id] and display error with incorrect data" do
      session[:user_id] = 1
      user = {
        username: "",
        password: "asdf",
        password_confirmation: ""
      }
      post :create, user: user
      session[:user_id].should be_nil
      response.code.should eq("302")
      flash[:error].should eq("Error creating user.")
    end
  end

end
