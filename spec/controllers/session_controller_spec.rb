require 'spec_helper'

describe SessionController do

  describe 'GET /new' do
    it "empty user object" do
      get :new
      response.should be_ok
      assigns(:user).should be_a_new(User)
    end
  end

describe 'POST /create' do
  before(:each) do
    @user = User.create(
      username:'nitin',
      password:'nitin',
      password_confirmation:'nitin'
    )
  end

  it "authenticate, flash notice and session[:user_id]" do
    post :create, username: 'nitin', password: 'nitin'
    session[:user_id].should eq(@user.id)
    flash[:notice].should eq('Logged in.')
  end

  it "flash error and set session[:user_id] to nil for incorrect login" do
    post :create, username: 'nitin', password: 'nitin'
    session[:user_id].should be_nil
    flash[:error].should eq('Error logging in.')
  end
end

describe 'GET /show' do
  it "should redirect to /session/new if not logged_in" do
    session[:user_id] = nil
    get :show
    response.code.should eq("302")
    flash[:error].should eq("Not logged in.")
  end

  it "successfully access if logged in" do
    session[:user_id] = 1
    get :show
    response.code.should eq("200")
    flash[:error].should be_nil
  end
end

describe 'GET /destroy' do
  it "should reset session[:user_id] and assign a flash notice" do
    session[:user_id] = 1
    get :destroy
    response.code.should eq("302")
    flash[:notice].should eq("Logged out.")
    session[:user_id].should be_nil
  end
end

end
