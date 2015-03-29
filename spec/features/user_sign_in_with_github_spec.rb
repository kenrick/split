require 'rails_helper'

RSpec.feature 'Signing in with github' do

  scenario 'sign in successfully' do
    visit '/'

    click_link 'Sign in with Github'

    expect(page).to have_content('Signed in sucessfully')
  end
end

