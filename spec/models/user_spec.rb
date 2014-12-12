require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
    # @user = FactoryGirl.build(:user)
    @user = create(:user)
  end

  it "should create a new instance of a user given valid attributes and check for email id" do
      expect(@user.email).to eq "wadiairfan.02@gmail.com"
  end

  it "should create a new instance of a user given valid attributes and check for password" do
    expect(@user.password).to eq "12345678"
  end

  it "should create a new instance of a user given valid attributes and check for Model" do
    expect(@user).to be_a(User)
  end

  it "should create a new instance of a user with bad email id" do
    attrs = attributes_for(:user)
    user = User.new(attrs.merge(:email => ""))
    expect(user).to_not be_valid
  end

  it "should create a new instance of a user with password less than 8 characters" do
    attrs = attributes_for(:user)
    user = User.new(attrs.merge(:password => "123"))
    expect(user).to_not be_valid
  end

  it "should create a new instance of a user with password less than 8 characters and check for its message" do
    attrs = attributes_for(:user)
    user = User.create(attrs.merge(:password => "123", :password_confirmation => "123"))
    expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
  end

  it "should create a new instance of a user with wrong password confirmation and check its message" do
    attrs = attributes_for(:user)
    user = User.create(attrs.merge(:password_confirmation => "123"))
    # puts user.errors.full_messages.class
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "should create a new instance of a user with password less than 8 characters" do
    attrs = attributes_for(:user)
    user = User.create(attrs)
    expect(user.errors.full_messages).to include("Email has already been taken")
  end

  it "should create a new instance of a user after deleting the same user with same email id" do
    attrs = attributes_for(:user)
    f = User.delete(1)
    user = User.create(attrs)
    expect(user).to be_a(User)
  end

end
