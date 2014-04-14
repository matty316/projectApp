require 'spec_helper'

describe "Signing Up" do
  subject {page}

  before { visit signup_path }

  describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create Account" }.not_to change(User, :count)
      end
    end

  describe "signup with valid content" do
    before do
      fill_in "Name", with: "Matt"
      fill_in "Email", with: "mattreed1890@gmail.com"
      fill_in "Password", with: "foobar"
      fill_in "Password Confirmation", with: "foobar"
    end

    it "should create a user" do
      expect { click_button "Create Account"}.to change(User, :count).by(1)
    end
  end





end
