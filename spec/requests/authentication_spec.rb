require 'spec_helper'

feature 'Facebook OAuth Authentication', :js, :vcr do
  scenario 'Facebook link redirects to the Facebook OAuth url' do
    pending 'PhantomJS does not like the double redirects'
    # visit root_path

    # click_link 'Facebook'
    # current_url.should match /^https:\/\/www.facebook.com\/dialog/
  end

  scenario 'Handling a Facebook callback' do
    visit oauth2_callback_path(:provider => :facebook, :code => 'test-auth-code')

    current_path.should eq dashboard_path
    page.should have_content 'test@example.com'
  end
end
