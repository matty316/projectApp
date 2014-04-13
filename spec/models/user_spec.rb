require 'spec_helper'

describe User do
  before { @user = User.new(name: "Matt Reed", email: "mattreed1890@gmail.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "not valid when name is blank" do
    before {@user.name = " "}

    it {should_not be_valid}
  end

  describe "name should be less that 50 chars" do
    before { @user.name = 'a' * 51}

    it { should_not be_valid}
  end

  describe "not valid when email is blank" do
    before { @user.email = " " }

    it { should_not be_valid }
  end

  describe "it should not accept invalid emails" do
    before { @user.email = "bad@e"}

    it { should_not be_valid }
  end

  describe "should not have duplicate emails" do
    before do
      user2 = @user.dup
      user2.email = @user.email.upcase
      user2.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end
