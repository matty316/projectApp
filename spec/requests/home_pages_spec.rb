require 'spec_helper'

describe "Home Page" do
  let(:title) { 'Look at what I just bought!' }

  subject { page }

  describe "Home Page" do
    before { visit root_path }

    it { should have_content('Look at what I just bought!') }
    it { should have_title("#{title}") }
    it { should have_link( 'Sign Up', "#") }

  end

  describe "About Page" do
    before { visit about_path }

    it { should have_content("About") }
    it { should have_title("#{title} - About") }
  end

  describe "Contact Page" do
    before { visit contact_path }

    it { should have_content("Contact") }
    it { should have_title("#{title} - Contact")}
  end
end
