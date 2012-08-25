require 'spec_helper'

describe User do
it "password and password confirmation" do
  user = User.new(
    username: 'nitin',
    password: 'nitin',
    password_confirmation: 'nitin'
  )
  user.password.should eq('nitin')
  user.password_confirmation.should eq('nitin')
end
it "required username" do
  user = User.new(
    password: 'nitin',
    password_confirmation: 'nitin'
  )
  user.save
  user.should have(1).errors_on(:username)
end

it "uniqueness username" do
  user = User.new(
    username: 'nitin1',
    password: 'nitin',
    password_confirmation: 'nitin'
  )
  user.save
  user2 = User.new(
    username: 'nitin',
    password: 'nitin',
    password_confirmation: 'nitin'
  )
  user2.should have(1).errors_on(:username)
end

it "match password and confirmation" do
  user = User.new(
    username: 'nitin',
    password: 'nitin',
    password_confirmation: 'nitin'
  )
  user.save
  user.should have(1).errors_on(:password)
end

it "required password_confirmation" do
  user = User.new(
    username: 'nitin',
    password: 'nitin'
  )
  user.save
  user.should have(1).errors_on(:password_confirmation)
end

context "successfully created user" do
  before(:each) do
    @user = User.create(
      username: 'nitin',
      password: 'nitin',
      password_confirmation: 'nitin'
    )
  end

end

end

