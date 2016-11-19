require 'spec_helper'

describe "Static pages" do

  subject { page }


  describe "Home page" do

    before do
     visit root_path 
    end

    #before { visit root_path }
    

    it { should have_content('Sample App') }
#    it "should have the content 'Sample App'" do
#      #visit root_path #'/static_pages/home'
#      expect(page).to have_content('Sample App')
#    end

    it "should have the title 'Home'" do
      #visit root_path #'/static_pages/home'
      expect(page).to have_title(full_title(''))
    end

    it "should not have a custom page title" do
      #visit root_path #'/static_pages/home'
      expect(page).not_to have_title('| Home')
    end

  end


 describe "Help page" do

    before { visit help_path }

    it "should have the content 'Help'" do
      #visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      #visit help_path #'/static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end

  
  end


 describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path #'/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About page'" do
      visit about_path #'/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end

end


describe "Contacts page" do

  it "should have content 'Contact'" do 
    visit contact_path
    expect(page).to have_content('Contact')
  end

end

end
